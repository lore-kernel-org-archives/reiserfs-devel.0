From: David Masover <ninja@slaphack.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Mon, 07 Feb 2005 23:53:17 -0600
Message-ID: <420853CD.80804@slaphack.com>
References: <20050206034102.3956432d@polo.concept-micro.com> <1107771769.9024.119.camel@tribesman.namesys.com> <20050207215036.39ca391c@polo.concept-micro.com> <200502071632.59292.mason@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502071632.59292.mason@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com, Pierre Etchemaite <petchema@concept-micro.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chris Mason wrote:
| On Monday 07 February 2005 15:50, Pierre Etchemaite wrote:
|
|>Le lun 07 f=E9v 2005 13:22:51 CET, Vladimir Saveliev <vs@namesys.com> a
=E9crit
|>
|>
|>>Hello
|>
|>	Hi,
|>
|>
|>>yes, reiserfs reuses inode number of removed files for newly created
|>>files. However, ext2 also does that. Have  you ever noticed this problem
|>>on other filesystems?
|>
|>No, but I'm only using rsync -H for a few weeks. The problem may also
exist
|>with tar, but unnoticed (unless tar detects hardlinks in a different way,
|>or does more checks, like checking the consistency with references
|>counters, whatever, to avoid it). rsync handles hardlinks in a final pass,
|>so as soon as the verbosity level is raised, problems are easy to detect.
|>
|>I have only one server left that uses ext2. It's also saved with rsync, no
|>problem seen so far (a few weeks only, as I said).
|>But the filesystem used isn't the only difference. Usage pattern probably
|>matters a lot. On the system where it happens, hardlinked files are often
|>Maildir files (unsurprizingly) and mrtg log files (which are rotated every
|>5 minutes). inodes are probably freed by mrtg, and one reused for a new
|>email.
|>
|
| If you've got files being deleted in the middle of the backup,  then
it is
| extremely difficult for rsync (or any tool) to get the hard link
detection
| correct.  You've got a few choices:
|
| 1) put everything on lvm and backup snapshots instead of the live
filesystem.
| This has a number of benefits.

Isn't snapshot support planned for reiser4?  It would be saner than
lvm/device-mapper -- no dedicated partition needed...

| 2) link everyfile into some temp directory before the backup starts.
This
| will prevent that particular inode number from being reused during the
| backup, but won't help if new files are added during the rsync (since
those
| new files could also be deleted).

Is this just backup?  You could use (or writing) a backup utility which
indexes by a hash of each file.  Wouldn't be that much slower, and would
avoid any issues with hardlink detection.

Don't know of any existing utility that does that.  I think BackupPC was
close (backuppc.sf.net)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQghTzXgHNmZLgCUhAQIy5xAAiT/ip19yy169PLqDJhMB1vtI1bEWiZsl
CWvljdxP4keoaWd32pXzZ1PJ1c3GoCb6W3TgxwlLgW+dvx87cvCQDK3pTFIpqOnL
0EGBwEkYVDEpmBdbkizuL744LSP+eubHFRfzJa5VFuZMROGIU2M5GbXlNM1uTimG
3q9rZSTmJL1pdAJqqZjNX0SRmg7z26KFKQL/E1Sm7E/VUAKrZSubqxEif4wG7JZ4
llNEitQlW61CG2nX8qgtta8ufrmmiAm37Vt6G7+fRyrKLbCIgsOuPOr//XL3j8aR
Qg4KrlWgjH/Fu/CR+TB+PSKeSBFbh47gvHChY3eqZaBg7UJ/ftPfZ/hz/m4S6MXK
Ic/Ww91cF/t6vMiErlj2GObggEgzRMq4ayitwxz19PucmSbv1gwVgmzVBX9uRvuZ
r/qE2r38qhzveiik3Y/MO8I5/R8H4FaF7JIhxNcujYqyqx6H4l4qfVksOG4Ox3OH
/sh3h7Ev+266w9WVbshD+gmFThvzDAKvjcntDFXLXDXMFGMKkrwbNVONczNPDkm3
G+ZiPjWyuKCaiGVbRPdvdQ4Jlpw4559E4APiHD7I4mhmdmmUVJSUbiTpVCQUA2gQ
F3dtiLTp4zshvG8yRqHS/CtWPMQHGo9TbjIKv4ynSOwXuAETiCtze7w9tZwZgV5W
UFAQ8tBHS24=3D
=3DogtF
-----END PGP SIGNATURE-----
