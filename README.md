# Pre-Test - Tinder

Tinder clone the UI of the real Tinder application

Submitted by: Hoang Duc Huu

Time spent: about  over 20 hours spent in total 

## User Stories

The following **required** functionality is completed:

* [x] User can see one person at a time to **Like** or **Pass**
* [x] User can check the list of people I have liked or passed so far
* [x] User can see a person's age in addition to their name and photo (note: age is not in the user list API call)
* [x] UI/UX: it should feel fast to swipe between people
	* [x] User can see the next person fast thanks to the user list API (without being blocked by liking/passing a person)
	* [x] User can see the current person's age thanks to the additional user detail. It's OK that the age takes time to display after name and photo.


The following **feature** are implemented:

- Swiper UI **Like** or **Pass**
- Preload data to avoid lagging, blocked
- User detail & reaction button on this screen
- History of **Like** or **Pass** users


## Video Walkthrough .

Here's a walkthrough of implemented user stories:

[<img src="https://github.com/hoangduchuu/tinder_test/blob/develop/video/screenshot.png?raw=true" width="200">](https://vimeo.com/manage/videos/706852823)


## Technical used
- Flutter version 2.10.4
- [GetX](https://pub.dev/packages/get) for state management
- [Moor](https://pub.dev/packages/moor_flutter) to work with sqlite & store local data
- Forked [flutter_tindercard](https://pub.dev/packages/flutter_tindercard) to implement swipe UI
- [Dio](https://pub.dev/packages/dio) to work with API network


## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
