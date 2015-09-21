From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Integrate fully partman-reiser4 into d-i
Date: Mon, 21 Sep 2015 16:49:02 +0200
Message-ID: <560018DE.9010205@gmail.com>
References: <CAM12Q5QKdpHgMG_qGyhE-abO6R-uY6cKtv-5Qg36N-FTx_Z8Lw@mail.gmail.com>
 <CAM12Q5Q2GQSqE2ehj2dAmkq4ffP=x3__F76dH7KOey=vVAkQOA@mail.gmail.com>
 <20150921111209.GA30565@riva.ucam.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=UZsO/b8Ptq/KYnxdUiNyWD1Y9QMbMd+UPU1tOzGBLOY=;
        b=BdZ1/W7XGx8sio4b/Ynqg/ClN6TFvoPSkC2jhsZRi6/BWsgjuO3j3NDj4Lf/Lumf7t
         Y1i9YnvuBTtF2NdnhE5jkgXOM9lKveB3BABJuUN//OA0XMecUTduzp5fAUPN7eAXF/UJ
         8Iw3EynueGHsvYkD7FQ8STrvVYgk773AbbtAMLJduzw4rNR2sthoqUHMR+/WbK4nbIpb
         VTrDBxCXR0hBrYI1DUiVhrce5UrRtmY0mqbdfEtkQlUjjNgF3NcYd/6djE8cHUpAghAn
         P6nFeXifPvpwfGnZBJDxjuNYP/xbw5Ech3Q78gPriTTDeCmMmvUHf3AR59JWhFEBCNeH
         x/CQ==
In-Reply-To: <20150921111209.GA30565@riva.ucam.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jose R R <Jose.r.r@metztli-it.com>, debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Cyril Brulebois <kibi@debian.org>, Ben Hutchings <ben@decadent.org.uk>

On 09/21/2015 01:12 PM, Colin Watson wrote:
> On Sun, Sep 20, 2015 at 07:40:37AM -0700, Jose R R wrote:
>> I have realized that although partman-reiser4 udeb enables Reiser4 to
>> be listed as an option during the Debian-Installer routine of a
>> netboot ISO image, the lack of support for reiser4 in GNU Parted
>> (Debian's libparted) prevents installation from the GUI interface.
> It should be pretty easy to add that to parted, since nowadays the only
> filesystem support it has is probing support.  I suggest preparing a
> patch against git://git.sv.gnu.org/parted.git master that adds the
> ability to detect existing reiser4 partitions and sending it upstream;
> it should only be on the order of a hundred lines.


Does anybody care to prepare the patch?
I think we just need to a read a sector at REISER4_MAGIC_OFFSET
and check the magic string ("ReIsEr4"), see definition of the struct
reiser4_master_sb.

Thanks,
Edward.


> I'd be happy to cherry-pick such a patch into the Debian packaging once
> it has been committed upstream.
>

