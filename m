From: Hans Reiser <reiser@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Wed, 29 Dec 2004 13:05:38 -0800
Message-ID: <41D31C22.9060400@namesys.com>
References: <20041228221218.GA6412@schmorp.de> <20041229185529.GA7513@hello-penguin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041229185529.GA7513@hello-penguin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stefan Traby <stefan@hello-penguin.com>
Cc: "Marc A. Lehmann" <pcg@goof.com>, reiserfs-list@namesys.com

Stefan Traby wrote:

>
>
>Here a script that works independent of hash (feel free to forward it to
>bugtraq - it's a showstopper bug):
>  
>
It is not independent of hash, it is hardcoded to be hash specific.  It 
is not a showstopper bug --- almost nobody cared about it for the last 5 
years.  If you don't accept that quality of service condition on 
filename creation, use reiser4 or ext3. 
