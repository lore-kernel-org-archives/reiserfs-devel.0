From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Thu, 18 Sep 2003 20:29:49 -0400 EDT
Message-ID: <17872444232-BeMail@cr593174-a>
References: <3F6A3F9A.5060803@mrs.umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F6A3F9A.5060803@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Grant Miner wrote on Thu, 18 Sep 2003 18:28:26 -0500:
> That also is nice and short, good to keep from hitting the maximum path 
> length.  BTW what is the max. path length?

In BeOS, it's 1024 bytes.  Max individual file name length is 256, including the NUL byte at the end of the string.  I'd expect Linux would be in the same ballpark.

- Alex
