From: Dan Labute <dan@discreet.com>
Subject: Creating large numbers of files
Date: Mon, 10 Jan 2005 17:34:21 -0500
Message-ID: <41E302ED.9040606@discreet.com>
References: <1105395827.2871.ezmlm@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1105395827.2871.ezmlm@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi all,

I'm a developer trying to create large numbers of *empty* files 
(~100000).  What is the fastest way to perform such an operation other 
than a simple open().  Will using multiple threads to perform concurrent 
operations help significantly, or am I just awell-off using a single thread?

Are there any extensions that could be used?  What about writing my own 
filesystem plugin?

Similarly, I'd like to create and destroy large numbers of hard & soft 
links.  What are my options?

(Apologies if these questions have been asked in other thread.)

Thanks,

Dan

