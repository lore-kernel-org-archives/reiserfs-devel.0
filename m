From: Daniel Horne <daniel.horne@gmail.com>
Subject: Reiser4 xattr format.
Date: Fri, 10 Mar 2017 22:22:48 +0000
Message-ID: <CAJZSrNL=7a4Z7oCc+H2e66wveA9OH2k_kuPYa4YwYq4FkOe+nA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=6D67PVUPawbvBM0beDLZ0EBllxYH5YVDFNNfkKqv48Q=;
        b=EOVbruD402Ig3djoVeNJH7YmgQAnKvJWgwJszfztAbuL5FFv6te3cjLRs79OhwHmc4
         q3tVMTIpScWMGk2pK0lkpwWZzN7oqD5ixxSv5HfHYknygPx/etGD+9vtt4kpCRz1/1tG
         vc/ClUaJyg9vJAvL7pA2HJtMaAKMiUu8Jz6zgoLEq9WiWzau4Wduc9hHhCp3apjAUOVU
         FHfuZzur1XmFZez+XzyfS5VrCkbqJzu2gIBKBMOz1vjPYYfPh24xkbgVNx/LXEo4xLHQ
         lR/00g/FoYtYLtrxl99P8LnAHSQ0liOq8mX/y47R/N9x/ijDXQRtuyN1xpaYp0QMHuuM
         en8Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

I've been looking into implementing xattr support, but I've a couple
of questions regarding how to deal with the on-disk format.

--Do we want all xattrs to be dealt with using the same generic
handler, or might it be worthwhile implementing a "plugin layer" to
allow different xattrs to be stored differently?

I can see that in the case of verifying the security on a file, the
system would read the username and mode (stat-data), posix ACLs and
selinux info in quick succession, so it'd be advantageous to store
those contiguously. In an earlier conversation with E.Shishkin, he
suggested using a stat-data plugin for xattr support, and I can see
that being appropriate in the case of ACLs and SELinux contexts, but
not in the more general case.

-- Are there any guidelines for the layout of the internals of objects
on Reiser4?

It's a correctness requirement to only return the proper contents for
a given prefix/xattr name. The easiest way to do this would be to just
store the full xattr name in each item. Seems a bit redundant, though,
given that the vast majority of xattr access will be to a couple of
common attribute types (such as posix ACL and selinux). Perhaps we
could do this more efficiently by having each attribute name assigned
a 32-bit int, though we'd have to store a dictionary somewhere on the
volume to map the full names to these short codes.
Hashing the name to a fixed size int is also a possibility, though as
this is a security requirement we'd have to use a cryptographic hash
of significant length, which probably wouldn't save much space..

-- How to structure the item layout so fsck can cleanly tell a corrupt
item from a healthy one.

Thanks,
DH
