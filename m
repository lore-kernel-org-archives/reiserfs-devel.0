From: Paolo Correnti <paolunix@yahoo.com>
Subject: Re: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 08:01:54 -0800 (PST)
Message-ID: <20040116160154.75186.qmail@web21506.mail.yahoo.com>
References: <20040116153914.46777.qmail@web21502.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040116153914.46777.qmail@web21502.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Correnti <paolunix@yahoo.com>, Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

After about 5-6 minutes after sending last e-mail
I obtained a "real" df result.

oracle@pamilo:/u01/oradata$ du

1868581 ./archived
10245   ./pamodb/archivelogs
1230589 ./pamodb                 <- OK
3099170 .                        <- OK

It seems there is a kind of very large delay in
reiser4 filesystem info synchronization.

Hope to be not much boring ...

Paolo Correnti

__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus
