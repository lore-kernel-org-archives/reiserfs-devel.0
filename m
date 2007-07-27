From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: request for patches: showing mount options
Date: Fri, 27 Jul 2007 16:12:58 -0400
Message-ID: <46AA51CA.7030105@oracle.com>
References: <E1IEQ7q-0000qE-00@dorka.pomaz.szeredi.hu> <46AA4AC5.2050200@oracle.com> <E1IEW21-0001kL-00@dorka.pomaz.szeredi.hu>
Reply-To: chuck.lever@oracle.com
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040108050409040809030404"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <E1IEW21-0001kL-00@dorka.pomaz.szeredi.hu>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, kzak@redhat.com, ericvh@gmail.com, lucho@ionkov.net, zippel@linux-m68k.org, hpa@zytor.com, raven@themaw.net, rathamahata@php4.ru, dhowells@redhat.com, sfrench@samba.org, mhalcrow@us.ibm.com, phillip@hellewell.homeip.net, hirofumi@mail.parknet.co.jp, mikulas@artax.karlin.mff.cuni.cz, wli@holomorphy.com, shaggy@austin.ibm.com, vandrove@vc.cvut.cz, trond.myklebust@fys.uio.no, aia21@cantab.net, mark.fasheh@oracle.com, kurt.hackel@oracle.com, reiserfs-devel@vger.kernel.org, bfennema@falcon.csc.calpoly.edu, dushistov@mail.ru, xfs-masters@oss.sgi.com, arnd@arndb.de, holzheu@de.ibm.com

This is a multi-part message in MIME format.
--------------040108050409040809030404
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Miklos Szeredi wrote:
>> Some mount options are never passed to the kernel, and thus can't appear 
>> in /proc/mounts.  Examples include user, users, and _netdev for NFS.
> 
> These options control *who* may mount and *when* to mount.  They are
> not a property of the mount itself and are not added to /etc/mtab.
> 
> There's a "user=ID" option that is added to /etc/mtab in case of user
> mounts.  This identifies the owner of the mount, so that it can be
> unmounted by that user.  There are patches in -mm that enable the
> kernel to store this info.
> 
> Do you have other examples in mind?

[no]quota comes to mind; also auto, [no]owner, [no]group, and 
quiet/loud, but these may fall into the same category you mention above.

Aside: It's a confusing artifact of the mount CLI that these options 
control who/when but are passed to the mount command in the same way the 
other options are.

--------------040108050409040809030404
Content-Type: text/x-vcard; charset=utf-8;
 name="chuck.lever.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="chuck.lever.vcf"

begin:vcard
fn:Chuck Lever
n:Lever;Chuck
org:Oracle Corporation;Corporate Architecture: Linux Projects Group
adr:;;1015 Granger Avenue;Ann Arbor;MI;48104;USA
title:Principal Member of Staff
tel;work:+1 248 614 5091
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------040108050409040809030404--
