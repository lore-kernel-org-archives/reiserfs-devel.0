From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Recommended patches for mail server?
Date: Tue, 15 Oct 2002 09:48:48 UT
Message-ID: <20021015094848.0A6E71AEC146@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi all,

We've been using Ext3 for a while at FastMail.FM, and have recently
started playing with the htree directory index patch. IO performance
hasn't been as good as we were hoping for, so we've started testing
ReiserFS. Our preliminary results are positive enough that we're going to
try switching some of our servers across to see if Real Life looks as
good as our testing.

We are running kernel 2.4.19, Cyrus 2.4.9, and Postfix 1.1.11, on dual
PIII/Athlon servers with RAID 5 arrays. I'm looking for some advice on
which patches we should be applying to get best performance and
reliability.

There's a bunch of patches in
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19.pending/ , but only
01-06 apply cleanly to 2.4.19. Should we be applying all of these
patches? If so, what's the trick to getting 07-13 to apply smoothly?

Then there's Chris Mason's data logging patches. From what I've read, it
sounds like these should improve both speed and reliability. Are they
well tested in production environments? Any reason for us not to use
these? Are many people using data=journal mode? Any benchmarks in mail
server stress tests?

Are there any other patches we should be adding? Our first priority is
ensuring that our servers stay up and that storage is reliable even in
the case of failure; however obviously performance improvements are nice
too!

Finally, has anyone using Cyrus/Postfix made the switch from/to Ext3? Any
comments on the process and results?

Thanks in advance for any info,
  Jeremy Howard
  http://FastMail.FM
