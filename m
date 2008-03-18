From: Hubert Chathi <hubert@uhoreg.ca>
Subject: Re: OpenAFS on Reiser4
Date: Mon, 17 Mar 2008 22:08:00 -0400
Message-ID: <877ig0dbsv.fsf@evinrude.uhoreg.ca>
References: <b8d16a880803142159h61dffabewed8870dd889af8b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <b8d16a880803142159h61dffabewed8870dd889af8b@mail.gmail.com> (Christopher Sawtell's message of "Sat\, 15 Mar 2008 17\:59\:04 +1300")
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

On Sat, 15 Mar 2008 17:59:04 +1300, "Christopher Sawtell" <csawtell@gmail.com> said:

> I'm trying to set up an OpenAFS node on a machine which happens to be
> running Reiser4.  The OpenAFS doco has dire warnings about running it
> with its cache on a ReiserFS partition.  Do these warnings apply to
> the Reiser4 filesystem as well?

IIRC, OpenAFS needs static inode numbers for files in its cache.  So if
Reiser4 uses static inode numebrs, then it should be fine.  Otherwise,
it won't be.

-- 
Hubert Chathi - Email/Jabber: hubert@uhoreg.ca - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA   (Key available at wwwkeys.pgp.net)
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
