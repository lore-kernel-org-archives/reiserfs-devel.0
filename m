From: lrc1@st-andrews.ac.uk
Subject: Re: Carrying Attributes too Far at Great Length
Date: Fri, 10 Oct 2003 12:27:30 +0100
Message-ID: <1065785250.3f8697a2152ae@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Transfer-Encoding: 8bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Quoting Hans Reiser <reiser@namesys.com>:

> Valid meaningful semantics can have cyclical structures.  I don't agree 
> with you for that reason.

Whoa there. I said that, if you understand a link from one directory to another 
as having the meaning "all files that are [child predicate] are necessarily 
[parent predicate]", then a cycle of directories has the meaning "any file that 
has any one of these predicates necessarily has all of them". In other words, 
directory cycles *do* have valid, meaningful semantics. It's just that there 
happens to be another way to express the same meaning - multiple pathnames to a 
single directory. So we can do without one approach if we want. For various 
reasons we should do without cycles.

So I'm definitely not denying that it's possible to express consistent, 
meaningful things using cycles. I'm not even asserting that there are no 
consistent, meaningful, useful extensions to the Unix file naming system which
would involve cycles. I'm only saying that it is unnecessary and undesirable
(but not unmeaningful) to allow cycles of the standard directory-to-directory
relationship.

> 
> -- 
> Hans

Leo.


-----------------------------------------------------------------
University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
