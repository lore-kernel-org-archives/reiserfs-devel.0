From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 ACL-Support
Date: Wed, 15 Sep 2004 06:58:23 -0700
Message-ID: <41484A7F.5080605@namesys.com>
References: <200409151540.58354.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409151540.58354.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcel Hilzinger <marcel@hilzinger.hu>
Cc: reiserfs-list@namesys.com

Marcel Hilzinger wrote:

>I found this in
>
>http://thebsh.namesys.com/snapshots/2004.02.06/READ.ME:
>
>reiser4 supports extended file attributes and POSIX acls with mount options
>   "xattr", and "acl" respectively. We are not going to maintain this
>   interface though. Reiser4 specific interface will be ultimately used
>   instead.
>
>Am I right, that in the final version there is no ACL-Support?
>No more or -- not yet...
>
>
>  
>
There is no acl support yet, and when it exists (it will) it will not 
use the xattrs interface.

Hans
