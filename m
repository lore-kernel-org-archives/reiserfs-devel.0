From: Shannon <shakim@bluebottle.com>
Subject: Re: Protect/Backup Encrypted FS
Date: Sat, 9 Apr 2005 11:56:28 +1000
Message-ID: <200504091156.28552.shakim@bluebottle.com>
References: <200504051448.55893.shakim@bluebottle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200504051448.55893.shakim@bluebottle.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I haven't received a reply to this, so I'm going to be more specific:

When you create an encrypted partition, where is this configuration stored?

On Tue, 5 Apr 2005 02:48 pm, Shannon wrote:
> /		10GB	Reiser
> /home	40GB	Reiser encrypted FS
> /swap	300mb
>
>
> As per the harddrive configuration, if my / partition becomes corrupted or
> if I choose to install a fresh copy of SuSe9.2 Pro over / and remount
> /home, what do need to backup or how do I backup the files needed to
> restore the encrypted partition /home
