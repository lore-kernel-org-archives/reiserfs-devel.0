From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: RE: A couple of questions
Date: Fri, 17 May 2002 10:27:46 -0500
Message-ID: <OFBBE2429A.90121BE9-ON85256BBC.0050432F@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


There have been many valid point raised here about the ability of a fsck
program to correctly fix all errors without user input.   Based on a quick
scan of the reiser fsck code, it appears to have relatively few user
prompts (except for the rebuild_bs path which I am excluding from this
discussion).   For keeping FSIM behaviors consistent in the EVMS interface,
I will implement the call to reiser fsck with a auto response of a carriage
return to accept the default action of the user prompt.  I will preface the
running of fsck in other than read-only mode with a warning that this will
occur and in the case where this is unacceptable to an experienced user, he
can still execute the fsck from the command line.  I will also capture all
of the output from fsck (including the banner/credits) and display to the
user.

Now, on to expand and shrink......

Steve

EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM


