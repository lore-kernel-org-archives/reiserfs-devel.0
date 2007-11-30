From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: building reiserfsprogs, no asm/unaligned.h
Date: Fri, 30 Nov 2007 15:27:57 +0300
Message-ID: <5c7c368b0711300427k6287d43bq57f275d74e9fdc39@mail.gmail.com>
References: <5c7c368b0711300402l2f740carb2ad852291610bd1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_15021_31680962.1196425677571"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:references;
        bh=Id6CWfiTyKz+0Sp0DOwOhqvJWh1cs0v9PSpJqIFSSQ4=;
        b=Js51fUQNbp9bnCKy1f9i5peJmGD/jzPwUiRoxBzT2hBpuGSKOS8LpRhZZIsM56xl8CsBrjzyojl0zg1FwM83N4hlN1s9E/AJmSeRhfW/SnEJBKMneajx7FAWOyYgmsEY3+lLl60hfoc/RM1dL7qpKCy12pBxQyFh4s+KngcMBXg=
In-Reply-To: <5c7c368b0711300402l2f740carb2ad852291610bd1@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

------=_Part_15021_31680962.1196425677571
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hmm.. Try this one:
http://chichkin_i.zelnet.ru/namesys/reiserfsprogs-3.6.19.tar.gz
This is a tarball from namesys.com
Make sure that installation process was okay.

The gpg-signature of this package is attached.
My public key can be found here:
http://marc.info/?l=reiserfs-devel&m=118505932502699&w=2

Thanks,
Edward.

Randy Dunlap <rdunlap () xenotime ! net> wrote:
> Hi,
>
> I was just trying to build reiserfsprogs-3.6.19 (got tarball
> from Debian mirror since namesys.com is offline).
>
> include/reiserfs_fs.h #includes <asm/unaligned.h>, but I don't
> have that file in /usr/include/asm-*.
> Has anyone addressed this?
>
> Thanks,
> ---
> ~Randy
> -
>

------=_Part_15021_31680962.1196425677571
Content-Type: text/plain; name=reiserfsprogs-3.6.19.tar.gz.asc
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f9mojsrc
Content-Disposition: attachment; filename=reiserfsprogs-3.6.19.tar.gz.asc

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuMi41IChHTlUv
TGludXgpCgppRDhEQlFCSFQvMDM3dENGb1N2SW5Sb1JBanhyQUo0dnVObTh1dnVIT3pkNmpCN2JU
OW1LUmRJZjFnQ2ZWMWhwClFkMEZRMVlUQnkvcENMcmVBNGxlZEdjPQo9NlN4VQotLS0tLUVORCBQ
R1AgU0lHTkFUVVJFLS0tLS0K
------=_Part_15021_31680962.1196425677571--
