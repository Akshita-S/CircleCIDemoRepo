public with sharing class Reddit_Post_Retriever {

    private static final String REDDIT_URL = 'https://www.reddit.com/r/pcmasterrace/hot.json?limit=1';
    private static final String GET = 'GET';

    public static List<Reddit_HotPost.Data> getRedditData() {
        List<Reddit_HotPost.Data> redditData = new List<Reddit_HotPost.Data>();

        Http httpCallout = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(REDDIT_URL);
        req.setMethod(GET);

        HttpResponse redditResponse = httpCallout.send(req);

        Reddit_HotPost redditPostRespone = Reddit_HotPost.parse(redditResponse.getBody());
        system.debug('redditResponse Status: '+redditResponse.getStatus());
        System.debug('redditResponse Status: '+redditPostRespone);
        List<Reddit_HotPost.Children> redditPosts = redditPostRespone.data.children;

        for(Reddit_HotPost.Children child: redditPosts){
            redditData.add(child.data);
        }

        for(Reddit_HotPost.Data child: redditData){
            system.debug('Child Author Name: '+child.author_fullname);

            system.debug('Child Name: '+child.name);

            system.debug('Child URL: '+child.url);
        }

        return redditData;
    }
}
