From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: getting UUID and label of a filesystem
Date: Mon, 10 Nov 2003 19:35:57 +0000
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20031110193557.GM3924@parcelfarce.linux.theplanet.co.uk>
References: <3FAAB330.5040503@nrao.edu> <20031106140747.Z10197@schatzie.adilger.int> <3FAFC969.4080401@nrao.edu> <20031110181212.GA2014@mis-mike-wstn.matchmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16038-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20031110181212.GA2014@mis-mike-wstn.matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Boyd Waters <bwaters+moz@nrao.edu>, Andreas Dilger <adilger@clusterfs.com>, reiserfs-list@namesys.com

On Mon, Nov 10, 2003 at 10:12:12AM -0800, Mike Fedyk wrote:
> > as non-root user:
> > 
> > $ /sbin/blkid /dev/loop5
> > /dev/loop5: LABEL="35" UUID="c9923c3f-da67-464f-ad55-6b4da22dabf0"\
> > TYPE="reiserfs"
> > 
> > 
> > So in a script:
> > 
> > #/bin/bash
> > FS_DEV=/dev/hda1
> > FS_UUID=`/sbin/blkid $FS_DEV | cut -d '"' -f4`
> 
> Better would be:
> 
> FS_UUID=`/sbin/blkid $FS_DEV |grep UUID | head -n1| cut -d '"' -f4`
> 
> That way you don't get multiple lines of output, and don't expect the first
> line to contain your UUID.

FS_UUID=$(/sbin/blkid "$FS_DEV" | awk -F'"' '/UUID/{print $4;exit}')

The /UUID/ probably should be $<some number>=="UUID" or $<some number>~/UUID/, 
but I don't know the column.

$() is now the preferred form and is nestable.  This is in the POSIX spec,
if your shell doesn't handle this form, your shell is not POSIX compliant.

The use of grep|head|cut pipelines is really poor form

-- 
Chris Dukes
I tried being reasonable once--I didn't like it.
