From: Oleg Drokin <green@linuxhacker.ru>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Wed, 21 Jan 2004 17:09:10 +0200
Message-ID: <20040121150910.GA10672@linuxhacker.ru>
References: <1074530725.29546.178.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16601-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1074530725.29546.178.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jan 19, 2004 at 11:45:26AM -0500, Chris Mason wrote:

> I've got most of data=ordered finished, there are a few paths like
> writepage and O_DIRECT that need tweaking.  Thanks to Oleg's file_write
> work in 2.6.x, the data=journal patch is much cleaner than 2.4, it is
> almost done but not included in the bunch of patches I just uploaded to
> ftp.suse.com.  Oleg is cc'd in case he wants to look over the changes to
> reiserfs_file_write in reiserfs-jh-2.

Cool. I'd certainly take a look at it. But may be in February, as I am in US
right now and I have not got any stable internet connection yet.

Thank you.

Bye,
    Oleg
