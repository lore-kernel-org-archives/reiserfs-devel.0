From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Re: Bug with KDE 4.5 and reiser4 2.6.34
Date: Sun, 31 Oct 2010 14:08:34 +0100
Message-ID: <201010311408.34589.volkerarmin@googlemail.com>
References: <201010310406.07767.volkerarmin@googlemail.com> <201010311243.28448.volkerarmin@googlemail.com> <4CCD5B1C.8070900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=HPbA02DnnxheXr7ii8PasJL/1Azf3MQyxkQGdclffq8=;
        b=MdL13hVUwwcj4PFOrmNN2SqXpx5e6dAHNyfAO8HjBrHUTMPgd3FcUxlw5Tk+1Wl+/H
         KqUvsFzhFgdHqRpnv/GG/0SmdEjsGkVP3w+emA1VGFLBNmsMvQv8qszCo3fUtrX2GjYE
         F39aNP4O37y1zJhVhzefijYsduxxePp9N5XyQ=
In-Reply-To: <4CCD5B1C.8070900@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

On Sunday 31 October 2010, you wrote:

> could you provide fsck output?

sure, here it is:

*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

=46scking the /dev/sda1 block device.=20
Will check the consistency of the Reiser4 SuperBlock.=20
Will build the Reiser4 FileSystem.=20
Continue?=20
(Yes/No): Y
***** fsck.reiser4 started at Sun Oct 31 13:42:25 2010
Reiser4 fs was detected on /dev/sda1.=20
Master super block (16):=20
magic:          ReIsEr4=20
blksize:        4096=20
format:         0x0 (format40)=20
uuid:           9d3a5406-15b9-4a95-95e3-256d1571408d=20
label:          <none>=20
=20
=46ormat super block (17):=20
plugin:         format40=20
description:    Disk-format plugin.=20
version:        0=20
magic:          ReIsEr40FoRmAt=20
mkfs id:        0x154b6487=20
flushes:        0=20
blocks:         15630416=20
free blocks:    4275401=20
root block:     7434018=20
tail policy:    0x2 (smart)=20
next oid:       0xd30db=20
file count:     712485=20
tree height:    5=20
key policy:     LARGE=20
=20
=20
CHECKING THE STORAGE TREE=20
        Read nodes 3162120=20
        Nodes left in the tree 3162120=20
                Leaves of them 3125028, Twigs of them 36573=20
        Time interval: Sun Oct 31 13:42:25 2010 - Sun Oct 31 13:43:39 2=
010=20
CHECKING EXTENT REGIONS.=20
        Read twigs 36573=20
        Time interval: Sun Oct 31 13:43:39 2010 - Sun Oct 31 13:44:01 2=
010=20
LOOKING FOR UNCONNECTED NODES=20
        Read nodes 0=20
        Good nodes 0=20
                Leaves of them 0, Twigs of them 0=20
        Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:44:02 2=
010=20
CHECKING EXTENT REGIONS.=20
        Read twigs 0=20
        Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:44:02 2=
010=20
INSERTING UNCONNECTED NODES=20
        Twigs: read 0, inserted 0, by item 0, empty 0=20
        Leaves: read 0, inserted 0, by item 0=20
        Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:44:02 2=
010=20
CHECKING THE SEMANTIC TREE=20
        Found 712485 objects.=20
        Lost&found 8 objects.=20
        Time interval: Sun Oct 31 13:44:02 2010 - Sun Oct 31 13:53:58 2=
010=20
CLEANING UP THE STORAGE TREE=20

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
