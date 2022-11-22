
function kakaoAuth() {
    try {
        Kakao.init('acf0fd7d2764b90e8d7a32a2eab4807a');			//자바스크립트 api 키값
    } catch (e) {
        ;
    }
}

ToShare = function (type, url, title, imgUrl) {

    //url = url.replace("https", "http");
    url_new = url.replace("NLCHS", "NLCMS");
    var url2 = CinemaServerDomain + "/NLCMS/APP/CallMobileApp?link=" + url_new;

    var shortUrl = encodeURIComponent(url);
    var openUrl, nt;

    if (window.location.href.toLowerCase().indexOf('movie') > -1) {
        kakaoImgW = 490;
        kakaoImgH = 692;
    } else {
        kakaoImgW = 750;
        kakaoImgH = 440;
    }


    switch (type) {
        case "t":	//Tweeter
            $.ajax({
                url: 'https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=AIzaSyA4qFPXdtnalrzfZqPZK6cboYRg2Ilh3Bg',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: '{ "dynamicLinkInfo": { "dynamicLinkDomain": "lottecinema12.page.link", "link": "' + url + '" }, "suffix": { "option": "UNGUESSABLE" } }',
                dataType: 'json',
                async: false,
                success: function (response) {
                    var result = response.shortLink;
                    url = result;
                }
            });

            nt = encodeURIComponent(title);
            openUrl = "https://twitter.com/intent/tweet?text=" + nt + "&url=" + url;
            window.open(openUrl, "twitter_pop");
            break;
        case "f":	//Facebook
            openUrl = "http://www.facebook.com/sharer.php?u=" + shortUrl;
            window.open(openUrl, "facebook_pop");
            break;
        case "k":	//Kakao Story
            kakaoAuth();
            Kakao.Story.share({
                url: url,
                text: title
            });
            break;
        case "kt":   //Kakao talk
            kakaoAuth();
            Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                    title: title,
                    imageUrl: imgUrl,
                    imageWidth: kakaoImgW,
                    imageHeight: kakaoImgH,
                    link: {
                        mobileWebUrl: url2,
                        webUrl: url2
                    }
                },
                buttons: [
                    {
                        title: '롯데시네마 가기',
                        link: {
                            mobileWebUrl: shortUrl,
                            webUrl: shortUrl
                        }
                    }
                ]
            });
            break;
    }
}