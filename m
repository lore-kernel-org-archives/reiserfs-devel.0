From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Reiser 3.6: Recover partition start position & Journal
Date: Thu, 01 Jan 2015 12:50:59 -0500
Message-ID: <54A58903.6070306@suse.com>
References: <CACyNnZP36ZsPJix48p9kAozdK0CFG+e_2z-xXH=mC2YwPnwBFw@mail.gmail.com>	<54A42F22.90505@telegraphics.com.au> <CACyNnZNqaSiV_ejW93LW-RPS0NSHfq4Mdmooc+xVqZ4mpNt2tg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CACyNnZNqaSiV_ejW93LW-RPS0NSHfq4Mdmooc+xVqZ4mpNt2tg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Felipe Monteiro de Carvalho <felipemonteiro.carvalho@gmail.com>, Toby Thain <toby@telegraphics.com.au>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 1/1/15 5:15 AM, Felipe Monteiro de Carvalho wrote:
> On Wed, Dec 31, 2014 at 6:15 PM, Toby Thain
> <toby@telegraphics.com.au> wrote:
>> I've done this for Reiser 3. I blogged about it here: 
>> http://slashdot.org/journal/110587
> 
> Thanks,
> 
> Indeed, supposing that the first found superblock is located at 
> REISERFS_DISK_OFFSET_IN_BYTES (0x10000) is a possibility. I was
> just wondering if there is anything more reliable, but it looks
> like that there isnt. The problem with this approach for an
> automated program is

Yeah, that's really your best bet. Any modern (read: any file system
created since the ~ Linux 2.2 days) reiserfs file system will have the
superblock at that offset.

> that it will fail if the first superblock was overwritten somehow.

Yep. If that's the case, you should be able to find many superblocks
in the journal. From there, you can go backwards until you find the
journal header block which, if internal, usually has a defined
location that starts immediately after the superblock. Then you'll
want to try to figure out which one is the most recent and part of a
complete transaction.

One caveat to all of this, and why newer file systems like btrfs have
self-identifying metadata, is if you encounter a file system image
hosted on the reiserfs file system. Since there's no way to determine
whether the blocks are part of the file or the file system hosting it,
you could get false positives. This is a problem for reiserfsck -S as
well.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)

iQIcBAEBAgAGBQJUpYkDAAoJEB57S2MheeWyhagP/0L38Z1BUq6i3Ap2alqpAy3W
zqTGRaHcvrzSLWmSxJhzQPa5oEcfptffnqWFjXQlI5ppowV5hMuH24OSpslxL8R1
8zI1TxLH7YmtXkte7J6PH0IsQ4Wv9zs7Y8lT05OvAjiWwUmjcWkKm7oQ4h1nMpiq
xBcpannENpJHNakldlgIbmsoGziOsrpB3qinep5YcVqmKtNsQm4/kVoxF5CnLj++
sWwK0Jciysm6RF2KKYIzZjDkisk5JsxpGy8qXeysrEPS3NRYiXOqR7yKqiX0Z6eI
5+ldrm7iVGiawW/ZdR1I+QJJQKpWt4SeKp7MdrKOcdAEwZ1qiFU0X3w80iLY+f7Q
jHOJ4ZCIX7oOCWHQdd/nD7e/RnCj366Ki/7zBSxBRauZo1Q6UqDXa6pftZROkdhZ
Pe1tez/igZbLWn2N2z886V2qRh9FrckC43pY880evXw1drEXMrQeZbSlG9gIa90H
Gj3Q0FqxfCVG7qYZPFwklkCszep9NVbcMq9lbUdOv0LWFdHmfb5T3DXqUk36aVKq
OYtYX7T1anwLZ9MgFnggcyxiMEiq4wCoZoBx5oh1vknM2oqcj0I/u+6usBwCld1P
K35opHXvC6p76sSXwtO/UpqSNY92gJCGDWylcfrDi/oAHhoZc3bj3DwxLD9kMoFq
R23nG+NXNqyyuUEOdkWa
=ChCT
-----END PGP SIGNATURE-----
