From: Tom Vier <tmv@comcast.net>
Subject: Re: need attrs patch for 2.5.44-ac3
Date: Tue, 29 Oct 2002 17:01:30 -0500
Message-ID: <20021029220130.GA9007@yzero>
References: <20021026230215.GA3258@yzero> <20021028193322.C1171@namesys.com>
 <20021029000923.GA527@yzero> <20021029090433.A5090@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20021029090433.A5090@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Tue, Oct 29, 2002 at 09:04:33AM +0300, Oleg Drokin wrote:
> In order for attributes to work you need to mount the volume with -o attrs.
> Without that you can only get/set attributes value.

i'm using the same /etc/fstab with attrs for 2.4 and it works. i haven't
tried mounting another reiserfs, so i don't know if it's just the rootfs
that's affected.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
