From: "Jaroslav Fojtik" <JaFojtik@seznam.cz>
Subject: Re4: Reiserfs3 is crashing - where/whom to report?
Date: Tue, 20 Jan 2009 18:49:55 +0100
Message-ID: <49760EC3.25886.AFADA@JaFojtik.seznam.cz>
References: <49750FC1.23700.2C929@JaFojtik.seznam.cz>, <4975AB4A.4070607@gmail.com>, <4975E58D.6040503@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <4975E58D.6040503@suse.com>
Content-description: Mail message body
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Dear Jeff Mahoney,

> > Ok, please, have the 2.6.24.7 kernel and reiserfsprogs-3.6.21
> > to format a partition:
> > http://www.kernel.org/pub/linux/utils/fs/reiserfs/reiserfsprogs-3.6.21.tar.gz
> > Catch all kernel messages and describe steps to reproduce the crash.
> 
> Since reiserfsprogs 3.6.21 doesn't support block sizes < 4k, he'll be
> unable to.

I would like to ask you - I have made windiff 3.6.19 and 3.6.21 and I have noted
several changes.

I can comment this piece of code if you really want to catch and fix 
a problem found:
    } else if (blocksize < 4096) {
        reiserfs_warning (stderr, "Block sizes smaller than 4k "
			  "are not supported.\n");
	return 0;
    }

I do not know why these block sizes has been disabled - stability? speed?
Overflowing block count?
   Anyway, nothing warned me when I have installed Slackware and build and mount 
riserfs disk of this kind.

  Jara

