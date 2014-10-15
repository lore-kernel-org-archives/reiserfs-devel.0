From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: patchset query
Date: Wed, 15 Oct 2014 10:59:51 -0400
Message-ID: <543E8BE7.4020303@suse.com>
References: <4454820674fe4b5749f1664aba6704e1@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4454820674fe4b5749f1664aba6704e1@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/11/14, 6:42 AM, doiggl@velocitynet.com.au wrote:
> Hello, Question: Does this patchset apply to a particular version
> of the linux kernel ? If so, which one ?
> 
> http://www.spinics.net/lists/reiserfs-devel/msg04338.html
> 
> [PATCH 0/12 v2] Moving i_dquot out of struct inode [PATCH 01/12]
> quota: Allow each filesystem to specify which quota types it 
> supports [PATCH 02/12] gfs2: Set allowed quota types [PATCH 03/12]
> xfs: Set allowed quota types [PATCH 04/12] fs: Generic
> infrastructure for optional inode fields [PATCH 05/12] quota: Use
> optional inode field for i_dquot pointers [PATCH 06/12] ext2:
> Convert to private i_dquot field [PATCH 07/12] ext3: Convert to
> private i_dquot field [PATCH 08/12] ext4: Convert to private
> i_dquot field [PATCH 09/12] ocfs2: Convert to private i_dquot
> field [PATCH 10/12] reiserfs: Convert to private i_dquot field 
> [PATCH 11/12] jfs: Convert to private i_dquot field [PATCH 12/12]
> vfs: Remove i_dquot field from inode

This patchset is intended for review and then inclusion in 3.18.

If you're looking to learn how to hack on the code, you should
probably figure how how the patches fit together and merge them on
your own. That's the only way you're going to be able to answer these
questions for yourself in the future. If you're just looking to test
them or something, and aren't comfortable doing this yourself, you
should probably wait until the next release.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJUPovnAAoJEB57S2MheeWyZ/kP/2MjQ3rNLdjGmGXAv0nm3QEn
oR1CEsMl5B443dm3dS0PXKyDGGyxsdEL0gstJjHu/j32z+mkjPAmf1Od3Oor9tLV
ZvDRIipUIAcGcuN75JWofpAcZxSvV8XmR0fZLZRHQD3KSyKfMKaoiq4QnJkAey4P
PX0K00sgRBwrdw1P2No9Pdotc8R/OtUaUFeueDcT1lW7LfWOgnlw1AEsfFDOcC3J
FqctIhqWu/OoyCY8JpDQMaP0YJV+8YdwqdaZE0GfcqyPg9achIZ6tZvV6pKE63aQ
8zThTRqE/qbDAkeLAslvvBUovAEorwZ+qrKjTjBFhr8y0pwkN1ARHjtsYp6TLf2p
sr5njt7OMzowD8JGGcWuHjjv8TPmOVKfR/CKNyLswqCsY5I5kF1qHP2/8GAa8gn6
wJNdby78Ia/vU6Ddu5H+HsZD7uJPelaixvXQbxg/6JV0B7ipc/c0K++oVl+gO4xa
V5ulPDP4bYfDtLk5U9Own/+VuyCiLt6UlDpymjWe/VOwtgGsfNU2UdYnex8UxiO5
BmR5CDunjHcbQ6GP5xuv1FSzcq4D7BsDnTRZ/RRJdXILDi8CFHDAOXvz9E6m042T
wvqm1awOkGNBG1OenEeUC7nAdwDlwIFzm6pysTXwFmxBAkZykmVVYLdwMERP4pb8
Ml7cg9yW9XTy/oEUzaSv
=zOZn
-----END PGP SIGNATURE-----
