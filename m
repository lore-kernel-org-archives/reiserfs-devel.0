From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Sat, 29 Mar 2003 11:55:40 -0500
Message-ID: <200303291155.40419.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <3E85CDEF.7B6BD323@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13435-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E85CDEF.7B6BD323@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Saturday 29 March 2003 11:46, Edward Shushkin wrote:
> Never trust 4-byte ID. The first collision that provides any assigned 4
> bytes in SHA1 output can be found very easy..

How many bytes of key ID would you use? A 4-byte key ID would mean that if 
about 92682 different keys were in use, there would be half a chance of a 
collision.

By the way, I am on the list.

