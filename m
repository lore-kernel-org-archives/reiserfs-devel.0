From: Ming Zhang <mingz@ele.uri.edu>
Subject: file name match speed
Date: Sat, 27 Aug 2005 18:59:08 -0400
Message-ID: <1125183549.5569.10.camel@localhost.localdomain>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25673-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

Hi folks

I would like to investigate the file name look up performance here.

assumed i have file name that is in digits, like 1,2,5,12, 43, 61,
98,300...

so how they will be hashed.

and if i want to look up file named as 64 while no such file available,
any quick way to find the file 61 in upper example? 

this is like a database query. select first X with X <=64. :)


Ming



