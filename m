From: "Henrique Faria" <henrique@streamworks.com.br>
Subject: Data loss during power off
Date: Tue, 25 Jun 2002 21:09:04
Message-ID: <20020626000904.22479.qmail@hm47.locaweb.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
References: 
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello!
We're using reiserfs 3.6.25 and linux 2.4.18, in a 256 MB flash memory card,
to develop a game. Data is written all the time, in local files, by the main
process. The "power off" test has to be done, for the machines will be
turned off with no shutdown process.
What's happening: pressing the power off button (during data writing) makes
data to be lost. Is it possible to force the data to be written in the file
system? I tried to change the JOURNAL_MAX_TRANS_AGE and the
JOURNAL_MAX_COMMIT_AGE consts. Less data is lost, but I still get some loss.
Thanks,

Henrique R. Faria
