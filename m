From: David Masover <ninja@slaphack.com>
Subject: Re: snapshot, checkpoints
Date: Wed, 09 Jun 2004 17:21:58 -0500
Message-ID: <40C78D86.2060305@slaphack.com>
References: <20040527065259.99429.qmail@web51306.mail.yahoo.com> <1085641393.1915.199.camel@tribesman.namesys.com> <20040527092727.GO4990@nysv.org> <20040604131005.hmvps8wcw4sccgcs@www.wagland.net> <200406041925.i54JPZgp025255@turing-police.cc.vt.edu> <40C14E9C.4000706@slaphack.com> <116CD3CA-B709-11D8-A933-000A95CD704C@kungfoocoder.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <116CD3CA-B709-11D8-A933-000A95CD704C@kungfoocoder.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Wagland <paul@kungfoocoder.org>
Cc: reiserfs-list@namesys.com, tdwebste2@yahoo.com, Vladimir Saveliev <vs@namesys.com>, Markus TXrnqvist <mjt@nysv.org>, Valdis.Kletnieks@vt.edu

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Paul Wagland wrote:
| At least with LVM, and therefore I assume with device mapper, the
| "snapshot" only stores changed blocks. From what I understand, this
| means that when you take a snapshot, if you change a block in the
| original, it first copies it to the snapshot, and then writes the new
| block to the original system. Of course, you will run into a problem if
| more changes are made than the snapshot partition size, but AFAIK it
| then just disables the snapshot.

Good, then we don't have to immediately rewrite the wheel.  But I still
would rather that we do this eventually.  My concept has the changes
stored on the same partition, seems like it may be faster, and opens the
door for a filesystem-based cvs.

Think about that!  I mean, if copy-on-capture is what I think it is,
then things like 'cp' could be extended to copy using a system call
(similar to how 'ln' works).  Probably a few utilities would have to be
extended, but the net result is, you don't have to say you're doing
something in a cvs dir for it to be cosidered a cvs action (just do 'cp'
instead of 'cvs cp' or whatever).  You don't "check out" different
versions, you just look in different folders.

(I'm using 'cvs' in the generic sense -- could work as easily for
bittorrent or anything else.)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQMeNhngHNmZLgCUhAQLe6w/+I5Emoxp6pLDA+9Ncd7UK0ZSkQsT0lwqu
jofkphMJ6hKZhE4KSB5IYup7Xh2ZqUZu1v+9gj0d/tLHatpCfLLklZJn0gKRA9+f
wUBY5VD18VmuWO0Zhi1R7QGAzijCThvyJTmhlu56E6dXEaQTxu7OufLmwfGDFgeT
LN3I/diPXVPp4AihzeFqT7F3/cYQgK/6wYgx9kB8QWsq9qcRzXY1XghuPgyoWJ9Y
AtIFmHmKLu9vP2S0mh7u6sv9R1UlzwdKZhpdxESytMqOV1m1xQbLdi5wLkS37i9l
Y9oxuhXXjiK+bkEwwdr+7/Ide1CzaRDthlBUMT+jy+zKekQLRLJtiZi3IhZeRb6V
UbO5SmHUqTxBltMEmp5zDMTX7QtT+n663GQCBzepMX55u9VWGTKrGYuSxDeJF5T7
5BT+FZ/UtY9ONL3hFFzMwAtaiI4r7rEIx0t2R1TVhsUhV69KmUXs4A2I0WOXPG4i
wFIQAjyX6BQtP3nn1QKIfeqpTRSHO2wPBC8dEAL8fFiiEBh/HEQdbbWCVCD3hj7G
0iNoLvL6w3qfPG+rRZtRdIn0apyd4zus0vWNpWWT8jh/QUeHGp97kzoEP3MQUlYk
kyVdFgwiX63l1AtJh6MWTDA2iVvegiaCY9Uuna5H77yJkV7uw8vc+TfRGRiq2otU
N7AQvJK8OBU=
=Nr9u
-----END PGP SIGNATURE-----
