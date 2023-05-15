# Music App

This music app was developed as part of the "Flutter Dicas Bootcamp" course. It is built with Flutter, a popular framework for developing cross-platform mobile applications. The app allows users to browse and listen to music from different genres. It utilizes several dependencies to provide a smooth and interactive user experience. The app also communicates with a simulated API server to retrieve music data.

## Dependencies

- **flutter:** The Flutter SDK is required for developing and running Flutter applications.
- **get:** A package that simplifies navigation and state management in Flutter applications.
- **dio:** A powerful HTTP client for making API requests in Dart.
- **dartz:** A functional programming package that provides algebraic data types and utility functions.
- **audioplayers:** A Flutter plugin for playing audio files.
- **flutter_dotenv:** A package for reading environment variables from a `.env` file.

## API Simulation

For simulating the API, you can use `jserver`, a tool that serves static JSON files as an API. Follow the steps below to run the API server:

1. Install `jserver` globally by running `npm install -g jserver`.
2. Create a JSON file (e.g., `api.json`) and copy the provided JSON into it.

   ```
   {
    "/genres": [
        {
            "img": "./assets/images/ambiente-cover.jpg",
            "title": "Ambiente",
            "searchString": "ambiente"
        },
        {
            "img": "./assets/images/eletronico-cover.png",
            "title": "Eletrônico",
            "searchString": "eletronico"
        }
    ],
    "/genres/ambiente": {
        "img": "./assets/images/ambiente-cover.jpg",
        "title": "Ambiente",
        "searchString": "ambiente",
        "musics": [
            {
                "img": "./assets/images/ambiente-musica-1.jpg",
                "title": "Touch and Sound",
                "path": "musics/touch-and-sound-113676.mp3",
                "duration": 261
            },
            {
                "img": "./assets/images/ambiente-musica-2.jpg",
                "title": "Middle East",
                "path": "musics/middle-east-127104.mp3",
                "duration": 182
            },
            {
                "img": "./assets/images/ambiente-musica-3.jpg",
                "title": "Muladara chakra music",
                "path": "musics/muladara-chakra-music-138093.mp3",
                "duration": 314
            },
            {
                "img": "./assets/images/ambiente-musica-4.jpg",
                "title": "Believe in Miracle by PrabajithK",
                "path": "musics/believe-in-miracle-by-prabajithk-121041.mp3",
                "duration": 122
            },
            {
                "img": "./assets/images/ambiente-musica-5.png",
                "title": "Hang Drum Meditations",
                "path": "musics/hang-drum-meditations-137894.mp3",
                "duration": 336
            },
            {
                "img": "./assets/images/ambiente-musica-6.jpg",
                "title": "Ambient Piano [Prod by BalanceBay",
                "path": "musics/ambient-piano-prod-by-balancebay-109400.mp3",
                "duration": 625
            },
            {
                "img": "./assets/images/ambiente-musica-7.jpg",
                "title": "Slow Motion",
                "path": "musics/slow-motion-121841.mp3",
                "duration": 133
            },
            {
                "img": "./assets/images/ambiente-musica-8.jpg",
                "title": "Documentary",
                "path": "musics/documentary-138619.mp3",
                "duration": 125
            },
            {
                "img": "./assets/images/ambiente-musica-9.jpg",
                "title": "Winter Backseat Kiss",
                "path": "musics/winter-backseat-kiss-130997.mp3",
                "duration": 191
            }
        ]
    },
    "/genres/eletronico": {
        "img": "./assets/images/eletronico-cover.png",
        "title": "Eletrônico",
        "searchString": "eletronico",
        "musics": [
            {
                "img": "./assets/images/eletronic-music-1.jpg",
                "title": "Lifelike",
                "path": "musics/lifelike-126735.mp3",
                "duration": 144
            },
            {
                "img": "./assets/images/eletronic-music-2.jpg",
                "title": "Powerful Beat",
                "path": "musics/powerful-beat-121791.mp3",
                "duration": 73
            },
            {
                "img": "./assets/images/eletronic-music-3.jpg",
                "title": "Password Infinity",
                "path": "musics/password-infinity-123276.mp3",
                "duration": 145
            },
            {
                "img": "./assets/images/eletronic-music-4.jpg",
                "title": "Stay Free",
                "path": "musics/stay-free-138363.mp3",
                "duration": 141
            }
        ]
    }
   }

   ```

3. Run the following command to start the API server:

jserver -h `YOUR_IP` -p 8080 -d api.json

Replace `YOUR_IP` with the IP address of your machine or the desired IP address where the API server should be accessible.

Note: Make sure to keep the API server running while using the music app.

## Environment Configuration

To configure the app to communicate with the simulated API server, you need to set the `API_BASE_URL` environment variable in a `.env` file. Create a `.env` file in the root directory of your project and add the following line:

API_BASE_URL="http://`YOUR_IP`:8080"

Replace `YOUR_IP` with the same IP address used when starting the API server.

## Important Information

- The music app provides two genres: "Ambiente" and "Eletrônico".
- Each genre contains a list of music tracks with their respective details.
- The app relies on the provided JSON file for music data.
- Images for genres and music tracks are located in the `assets/images` directory.
- Music files are stored in the `musics` directory.

Feel free to explore and modify the app according to your requirements. Happy coding!

This app was created as part of the "Flutter Dicas Bootcamp" course. Visit [Flutter Dicas](https://flutterdicas.com.br/bootcamp/) to learn more about the course and discover other helpful resources for Flutter development.
