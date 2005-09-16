From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 in 2.6.14-rc1-mm1
Date: Fri, 16 Sep 2005 17:40:39 +0400
Message-ID: <432ACB57.5070006@namesys.com>
References: <dge8vb$j9n$2@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <dge8vb$j9n$2@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lexington Luthor <lexington.luthor@gmail.com>
Cc: reiserfs-list@namesys.com

Lexington Luthor wrote:

> Hi,
>
> Do the reiser4 updates in the new -mm kernel include the compression 
> plugin?
>
> If so, I would love to be able to try it out on my laptop (only 20GB 
> disk). Do I have to mkfs again, or can I enable it at mount time, or 
> is it a per-file or per-directory attribute like NTFS?


Hello.
It was possible earlier to set it per directory using pseudo-file interface,
but 2.6.14-rc1-mm1 does not contain it already. We will try to post and
update the appropriate patch, but anyway using cryptcompress plugin
can crash your system.

Thanks,
Edward.
