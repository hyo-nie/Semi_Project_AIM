/**
 * URLSearchParams 대처 함수(IE에서만 사용한다)
 * @param {any} parameters
 */
function URLSearchParamsCustom(parameters) {

    this.parameters = parameters;

    this.get = function (name) {
        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(this.parameters);
        if (results == null) {
            return null;
        }
        else {
            return decodeURI(results[1]) || 0;
        }

    }
}