From: David Masover <ninja@slaphack.com>
Subject: Re: ext3 -> reiserfs conversion utility?
Date: Fri, 18 Jun 2004 23:00:35 -0500
Message-ID: <40D3BA63.70307@slaphack.com>
References: <57818.192.168.1.12.1087599726.squirrel@192.168.1.12>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19264-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <57818.192.168.1.12.1087599726.squirrel@192.168.1.12>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nick Bartos <spam99@2thebatcave.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Nick Bartos wrote:
<snip>
| From what I am reading, everyone just backs up their files and then
| reformats & restores the files.

For any two filesystems, it's highly unlikely that you can just convert
between the two.  I mean, theoretically yes, practically?  There's not
even funding (I think) for a reiser 3-4 conversion.

| Is there any other way?  I have too many and it would be a huge pain to do
| that will all of them.

Do backups.  Now.  You are an idiot and/or a cheapskate if you don't
have backups, because one day something will happen -- probably
something ridiculously stupid -- and you will need them.  I mean, go
build a backup server and, if you can afford it, give it something like
a terabyte raid5 hotplug array.  Do it now.

If you are backing up, I hope I haven't offended you.  In such a case,
it's highly likely that you can restore your backup even using something
like Knoppix.  If you can't, go rethink how you're doing your backups.

In fact, I suggest you fit each of them with cd drives or floppy drives
(cheap ones are fine) and make a custom boot cd or floppy that restores
the backup on boot.  This simplifies the process of changing
filesystems, and also means you can be back up and running in a hurry.

How similar are these boxes, btw?  I bet you can make them all use the
same cd for restoring a backup (getting the id of the machine from its
mac address).  For that matter, you might even set up a net boot server
- -- this makes things simpler, as a change to the backup process couldn't
possibly require burning a bunch of new cds.

With such a system in place, total time to change filesystems is --
install reiserfsprogs, a reiser-enabled kernel, and slight config
changes on the net boot server, then go around and reboot each computer,
manually specifying a net boot.  Or have a net boot floppy, and put a
copy in each computer -- leave it sticking out of the drive when you
don't need it, push it in and reboot for new fs.  Then sit back and wait.

Now, it will still be a huge pain, but probably worth it.  Reiserfs
always seemed a lot faster than ext3 to me.  Reiser4 seems just as much
faster than v3.  And full backup + speedy recovery = good always.

This is sent to the list as generic advice for anyone with multiple boxes.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQNO6Y3gHNmZLgCUhAQL2MBAAgfJbIPhP3Av4R/JAfYlkeWZwXhgFJEM4
xWxquB9gErNtKcK6X6EqeQ9fPZcfY1tDVFOgqgnNkE3KKy8jH5rjIx7aRKML4U9O
Xf/XkIi3T+vIWFMQp8FkteWMvp2vc6I6DTzkEFzLYjZcbFAjPjylHE6GlGTScyNi
slMzDFElP3IFd9mzhJJ2QvwlVXy/ULQJCLfovBUoei9AREkQye1dqGz3J9tCoqVq
K2DgMsFmuACuRC5lFqcREAr1pGnQz0CmNObj0i0HrAt0f/DkJePQUQwv0TpK3TbO
NheeF2669cPuDcPfZpMVJzs9/+gXBKL5HVOb8amctVm0z0qavEu+/CA/UlwtEuVg
3A0HVd+woVyPsstuVNI9Blp5iBXKxvDr1BmulOQSTddEQuwYWf70arLbs0LQ1Z3V
FKn56T55wiGZr8MGC8cfTl333rvpWwUHsXMbhFezsuzesqiH04xlIeCDMyqbtO1f
b+WLIA72GW9yR+Z0ArcsxFDpfWX9jVmeCbzbRkTae9Nytj/5C8/lCVHzOsVFhYcH
dJwcQr69YZ/21LY82HZ0cGQ6K8KY0F2aCBywAEBMFLjy04Wql6W0WCH05v20wz64
RsgjESCT47f+XFySD+fbQDvIOifY7CAIKDNyFQwhmXhr/mF2V5EWh99M2yKTkvJN
O/hb/AUcCaE=
=AntR
-----END PGP SIGNATURE-----
