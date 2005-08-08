From: "Hemiplegic Menehune" <Hemiplegic.Menehune@gmail.com>
Subject: reiser4 performance
Date: Mon, 8 Aug 2005 11:32:23 +0100
Message-ID: <dd7cbn$kbg$1@sea.gmane.org>
Reply-To: "Hemiplegic Menehune" <Hemiplegic.Menehune@gmail.com>
Return-path: <reiserfs-list-return-25340-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I just wanted to say thank you for putting together reiser4 :)

I just upgraded to the latest -mm kernel on my box and my jaw is on the 
floor looking at the performance of reiser4. I have previously played around 
with it on a few occasions, but I never had the chance to test it with my 
software before - it is literally 3 times as fast as reiserfs3 (which itself 
is twice as fast as ext3) - how did you guys do it? :)

The only thing reiser4 runs slower than ext3 is postgresql!

Its already as stable as any other fs on my systems and recovers better than 
most when my battery runs out. Any idea when it will make it into the stable 
2.6 kernel?

- HM



