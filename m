From: Dushan Tcholich <dusanc@gmail.com>
Subject: Re: Reiser4 for 2.6.36 kernel panic
Date: Mon, 7 Mar 2011 19:50:05 +0100
Message-ID: <AANLkTimqtUR-Wfja8tpC4LATZYVpN5N01aPGLFqzOV8K@mail.gmail.com>
References: <AANLkTimrF930Dh82UKoq=M0mDy7aVrvbXC=ZDoTZT_YC@mail.gmail.com>
	<4D713169.3060906@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=A6Rq3oLUISOMCw4f/Vc0XgBmF1YN71QqPI8bqBgxhn4=;
        b=I2PklKuIDaYk/MSwQKp70yil+u3ACywWmcbfSqrSJrLaFd19d5Unlrmva0a69idssF
         lho5v0SyP1NGswL6s+1waKGMUuQlZf/Ucply7DFinq+vEceTWtCOS/ssa79x9lPmoDDk
         lpW5rnhpwrOGmg3kDk9NlZhZKeDC43RGXiUdU=
In-Reply-To: <4D713169.3060906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

I went back to older kernel config (which worked for me atleast for a
month uptime before) and after 2 days uptime nothing bad happened,
machine is fine and nothing in logs.

This is the diff of configs (good one > with problems):

4c4
< # Tue Feb  8 18:39:42 2011
---
> # Thu Mar  3 17:35:09 2011
352c352,353
< # CONFIG_PM_RUNTIME is not set
---
> CONFIG_PM_RUNTIME=3Dy
> CONFIG_PM_OPS=3Dy
434a436
> CONFIG_PCIE_PME=3Dy
738c740
< # CONFIG_FIRMWARE_IN_KERNEL is not set
---
> CONFIG_FIRMWARE_IN_KERNEL=3Dy
1162a1165
> CONFIG_I2C_ALGOBIT=3Dy
1339,1343c1342
< CONFIG_AGP=3Dy
< # CONFIG_AGP_AMD64 is not set
< # CONFIG_AGP_INTEL is not set
< # CONFIG_AGP_SIS is not set
< # CONFIG_AGP_VIA is not set
---
> # CONFIG_AGP is not set
1347c1346,1355
< # CONFIG_DRM is not set
---
> CONFIG_DRM=3Dy
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_TTM=3Dy
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> CONFIG_DRM_RADEON=3Dy
> CONFIG_DRM_RADEON_KMS=3Dy
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
1350c1358,1415
< # CONFIG_FB is not set
---
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> # CONFIG_FB_DDC is not set
> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> # CONFIG_FB_SYS_FILLRECT is not set
> # CONFIG_FB_SYS_COPYAREA is not set
> # CONFIG_FB_SYS_IMAGEBLIT is not set
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> # CONFIG_FB_SYS_FOPS is not set
> # CONFIG_FB_SVGALIB is not set
> # CONFIG_FB_MACMODES is not set
> # CONFIG_FB_BACKLIGHT is not set
> # CONFIG_FB_MODE_HELPERS is not set
> # CONFIG_FB_TILEBLITTING is not set
>
> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_VESA is not set
> # CONFIG_FB_N411 is not set
> # CONFIG_FB_HGA is not set
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_LE80578 is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_GEODE is not set
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> # CONFIG_FB_BROADSHEET is not set
1364a1430,1437
> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> # CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
> # CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
> # CONFIG_FB_CON_DECOR is not set
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=3Dy
> CONFIG_FONT_8x16=3Dy
> # CONFIG_LOGO is not set
1564a1638
> # CONFIG_USB_SUSPEND is not set

I hope this helps

Thanks
Dushan

On Fri, Mar 4, 2011 at 7:37 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 03/04/2011 07:08 PM, Dushan Tcholich wrote:
>>
>> I captured kernel output with a mobile
>> camera.http://img854.imageshack.us/i/04032011.jpg/
>>
>> =C2=A0Missing text says:
>> "reiser4_handle_error (fs/reiser4/vfs_ops.c:240)[foobar-42]
>>
>> It happened day after I enabled KMS in kernel for ati card, didn't
>> notice this problem earlier.
>>
>> It happened twice, once after ~12h uptime, next time after ~2h uptim=
e.
>
>
> Could you please check kernel messages more carefully:
> are there complaints (IO errors, etc) of any low-level
> subsystem?
>
> Thanks,
> Edward.
>
>>
>> Nothing in /var/log/messages
>>
>> Have a nice day
>>
>> Dushan
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
