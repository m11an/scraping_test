const swaggerUI = require('swagger-ui-express');
const PORT = 8000;
const puppeteer = require('puppeteer');
const express = require('express');
const cors = require('cors');
const swaggerSpec = require('./swagger.js');

const swaggerJsDoc = require('swagger-jsdoc');

const options = {
    definition: {
      openapi: "3.0.0",
      info: {
        title: "Scraping APIs",
        version: "1.0.0",
        description: "A simple Express Library API",
        termsOfService: "http://example.com/terms/",
        contact: {
          name: "API Support",
          url: "http://www.exmaple.com/support",
          email: "support@example.com",
        },
      },
  
      servers: [
        {
          url: "http://localhost:8000",
          description: "My API Documentation",
        },
      ],
    },
    apis: ["*.js"],
};
  
const specs = swaggerJsDoc(options);

const app = express();

const scrapingProfile = async (username) => {
    const browser = await puppeteer.launch({ headless: true });
    const page = await browser.newPage();
    var userProfile;
    await page.goto('https://www.instagram.com/' + username);
    await page.waitForSelector('header ', {
        visible: true,
    });
    await page.waitForSelector('img ', {
        visible: true,
    });

    const date = await page.evaluate(() => {
        const numbers = document.getElementsByClassName('_ac2a');
        const listOfPost = document.querySelectorAll('img');
        const list = Array.from(listOfPost).map(post => post.src);
        userProfile = {
            "post_count": numbers[0].textContent,
            "followers": numbers[1].textContent,
            "following": numbers[2].textContent,
            "list_urls_for_images": list,
        }

        return JSON.stringify(userProfile);
    });

    await browser.close();
    return date;
}

/**
 * @swagger
 * /scrapingInsta/:
 *   get:
 *     summary: scraping instagram
 *     tags: [Posts]
 *     parameters:
 *       - in : query
 *         name: username
 *         description: username for the instagram scraping
 *         schema:
 *           type: string
 *         required: false
 *     responses:
 *       200:
 *         description: Succesful scraping of a profile
 *       404:
 *          description: username not found
 */
app.get('/scrapingInsta', (req, res) => {
    var username = req.query['username'];
    scrapingProfile(username).then((user) => {
        res.send(user);
    })
});

app.get('/', (req, res) => {
    res.send("Hello, world");
})

app.use(cors({ origin: '*' }));
app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(specs))
app.listen(PORT, () => console.log('server running on PORT ' + PORT));