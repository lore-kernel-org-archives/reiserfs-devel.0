From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: struct dirent *ent->d_type weirdness
Date: Mon, 19 Sep 2005 11:14:17 -0600
Message-ID: <20050919171416.GF12946@schatzie.adilger.int>
References: <200509191558.27362.kris@koehntopp.de> <432ECC4C.30707@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <432ECC4C.30707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Kristian =?iso-8859-1?Q?K=F6hntopp?= <kris@koehntopp.de>, reiserfs-list@namesys.com

On Sep 19, 2005  18:33 +0400, Vladimir V. Saveliev wrote:
> Kristian K=F6hntopp wrote:
> > My goal is to walk a spool directory recursively and deal with=20
> > all files inside directories that I encounter. For that, I check=20
> > struct dirent *ent->d_type and get unexpected results.
> >=20
> Yes, unfortunately, reiserfs does not support entry types.
>
> > 	 /* disable actual test and print ent->d_type */
> > 	 /* ent->d_type=3D=3DDT_DIR && ent->d_name[1]=3D=3D0 && ent->d_name[0]=
>0=20
> > && ent->d_name[0]!=3D'.'*/

You need to stat() the entry to find the type if d_type is DT_UNKNOWN.
I would continue to use d_type as an optimization, however, as this
reduces the number of syscalls needed when it is supported, and for
network filesystems a stat() may be an expensive operation.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.

