From: Hans Reiser <reiser@namesys.com>
Subject: Re: File system shootout v2.0...
Date: Fri, 17 Oct 2003 10:03:29 +0400
Message-ID: <3F8F8631.3010106@namesys.com>
References: <1066328379.27235.80.camel@mikeb.staff.netnation.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1066328379.27235.80.camel@mikeb.staff.netnation.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mikeb@netnation.com
Cc: reiserfs-list@namesys.com

Mike Benoit wrote:

>Since the last shootout was so popular, I was able to get my hands on
>some better hardware to run even more tests on. As well the generated
>results format was improved slightly. 
>
>Bonnie++ and IOZone results on a AMD Opteron 240 system are now posted
>for your viewing pleasure at: http://fsbench.netnation.com/
>
>  
>
We have a new snapshot on the way that does much better at this 
benchmark (we fixed a bug thanks to spotting a performance anomaly while 
replicating your settings, and the snapshot you are using is actually 
quite old thanks to our neglect of posting snapshots).

I will be interested in seeing whether once you and us are using the 
same snapshot we get the same results.;-) 

It is a bit odd that reiser4 has both the lowest run time and the worst 
rating.  We use middle of the road 32 bit CPUs (we'd like to use the 
latest ones but....;-) ).  For them our CPU consumption seems reasonable.

-- 
Hans


