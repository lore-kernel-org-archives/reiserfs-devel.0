From: "darren" <teodarren@myrealbox.com>
Subject: reiserfs vs NTFS for large amount of small file transactions
Date: Thu, 15 Aug 2002 23:53:48 +0800
Message-ID: <001001c24473$f2c379e0$0101a8c0@bummer>
References: <20020815085659.A4232@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020815085659.A4232@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'reiserfs-list' <reiserfs-list@namesys.com>

Hi all,

I am doing a school project that requires me to constantly move a large
number (100,000 to 300,000) of files from 1 server to 4 desktops.

I am currently doing it in NTFS, and the result was not too good.

Last week, I did that same thing using a linux box running ext3fs, and
the result was worse!

People in the other newsgroup told me to try reiserfs and that's why I
am here.

Are there any benchmarks of reiserfs vs ntfs?

Do you all think reiserfs is suitable for my use?

Regards
darren

