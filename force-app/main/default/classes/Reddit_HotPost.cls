public class Reddit_HotPost {

    @AuraEnabled
    public Post data;

	public class Post {
        @AuraEnabled
		public List<Children> children;
	}

    public class Children {
        @AuraEnabled
		public Data data;
	}

	public class Data {
        @AuraEnabled
		public String author_fullname;
        @AuraEnabled
		public String name;
        @AuraEnabled
		public String url;
	}

	public static Reddit_HotPost parse(String json) {
		return (Reddit_HotPost) System.JSON.deserialize(json, Reddit_HotPost.class);
	}
}