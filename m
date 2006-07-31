From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 19:34:00 +0200
Message-ID: <20060731173400.GA9466@merlin.emma.line.org>
References: <1153760245.5735.47.camel@ipso.snappymail.ca> <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl> <20060731125846.aafa9c7c.reiser4@blinkenlights.ch> <20060731144736.GA1389@merlin.emma.line.org> <20060731175958.1626513b.reiser4@blinkenlights.ch> <20060731162224.GJ31121@lug-owl.de> <1154364421.7964.22.camel@localhost> <20060731171620.GL31121@lug-owl.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060731171620.GL31121@lug-owl.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Oglesby <doglesby@teleformix.com>, Adrian Ulrich <reiser4@blinkenlights.ch>, Matthias Andree <matthias.andree@gmx.de>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Jan-Benedict Glaw schrieb am 2006-07-31:

> Uh?  Where did you face a problem there?
> 
> With maildir, you shouldn't face any problems IMO. Even users with
> zillions of mails should work properly with the dir_index stuff:
> 
> 	tune2fs -O dir_index /dev/hdXX
> 
> or alternatively (to start that for already existing directories):
> 
> 	e2fsck -fD /dev/hdXX

hat is not "alternatively", but "tune2fs first", then "e2fsck -fD"
(which can't happen on a RW-mounted FS and you should only try this on
your rootfs if you can reboot with magic sysrq or from a rescue system).

-- 
Matthias Andree
