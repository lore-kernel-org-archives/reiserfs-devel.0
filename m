From: Lars Marowsky-Bree <lmb@suse.de>
Subject: Re: Reiserfs oops
Date: Thu, 10 Apr 2003 20:06:01 +0200
Message-ID: <20030410180601.GN7458@marowsky-bree.de>
References: <93F527C91A6ED411AFE10050040665D007AA83FC@CORPUSMX1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13633-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <93F527C91A6ED411AFE10050040665D007AA83FC@CORPUSMX1>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: berthiaume_wayne@emc.com, green@namesys.com
Cc: reiserfs-list@namesys.com

On 2003-04-10T13:56:05,
   berthiaume_wayne@emc.com said:

>         Oleg, I'm seeing the attached oops's when a hard drive failure is
> encountered. There are four drives in RAID 1. Is it normal for reiserfs to
> oops when a drive fails?
> Attached oops file...

AFAIK yes, if the drive error escalates up to reiserfs and is not masked by
the RAID1. Jeff is working on that.


Sincerely,
    Lars Marowsky-Br=E9e <lmb@suse.de>

--=20
SuSE Labs - Research & Development, SuSE Linux AG
 =20
"If anything can go wrong, it will." "Chance favors the prepared (mind)."
  -- Capt. Edward A. Murphy            -- Louis Pasteur
