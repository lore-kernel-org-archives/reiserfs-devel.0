From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: Reiserfs, highquality meds source, low rates
Date: 19 Apr 2004 20:14:48 -0400
Message-ID: <c61q1o$6bk$1@satsuki.furryterror.org>
References: <000001c425b0$1750e0b8$4fa9aa0e@fluridden.com> <20040419115902.GD15007@alias.nmd.msu.ru> <20040419115902.GD15007@alias.nmd.msu.ru> <4083C0B0.6090607@mweb.co.za>
Return-path: <reiserfs-list-return-18066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <4083C0B0.6090607@mweb.co.za>, Cami  <camis@mweb.co.za> wrote:
>> i am just not sure how to kill THIS messages which look so....
>> they dont look like spam, even to me upon first look.
>
>If you were using SpamAssasin, you wouldn't get these..

I _am_ using SpamAssassin, and I got this.  

Actually, this has turned into a neat example of how to poison a Bayes filter.

The original spam got flagged on my system like this:

X-Spam-Status: No, hits=2.9 required=5.0 tests=BAYES_40,HTML_MESSAGE, 
	RCVD_IN_DYNABLOCK,RCVD_IN_RFCI,RCVD_IN_SORBS autolearn=no version=2.63

So this got through the usual SA rules, none of which give very high
scores, and even the Bayes filter isn't sure.

Then comes your message, with a quote of the original spam:

X-Spam-Status: No, hits=-3.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham  
	version=2.63

So...my Bayes filter just auto-trained itself on the contents of the
spam message...as ham.  If I now feed the original spam through SA
again, it gets BAYES_01, and a score of -1.5.  Clearly I'm going to be
receiving a _lot_ of these, at least until I batch them all up and feed
them to sa-learn to retrain the Bayes filter.

Folks, if you want to talk about spam on a (non-spam-related) mailing
list, please please please don't quote it, no matter how interesting it
may be.  Or at least, if you do quote it, be sure to include a sentence
or two that contains gratuitous references to the names of chemicals
often used to mitigate the effects of problems that may arise with men
and the organs they use to procreate.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
