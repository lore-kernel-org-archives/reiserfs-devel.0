From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 2.6.36 kernel panic
Date: Thu, 24 Mar 2011 23:34:57 +0100
Message-ID: <4D8BC711.1020101@gmail.com>
References: <AANLkTimrF930Dh82UKoq=M0mDy7aVrvbXC=ZDoTZT_YC@mail.gmail.com>	<4D713169.3060906@gmail.com>	<AANLkTimqtUR-Wfja8tpC4LATZYVpN5N01aPGLFqzOV8K@mail.gmail.com> <AANLkTimYL=czRRmTSUabohUKNgKzmciKAavfLKqj5aRP@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimYL=czRRmTSUabohUKNgKzmciKAavfLKqj5aRP@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 03/24/2011 11:13 PM, Dushan Tcholich wrote:
> After 17 days more with old config machine stays up, no problems.
>

Make sure you have passed "onerror=remount-ro", Ok?


> Thanks
>
> Dushan
>
> On Mon, Mar 7, 2011 at 7:50 PM, Dushan Tcholich<dusanc@gmail.com>  wrote:
>> I went back to older kernel config (which worked for me atleast for a
>> month uptime before) and after 2 days uptime nothing bad happened,
>> machine is fine and nothing in logs.
>>
>> This is the diff of configs (good one>  with problems):
>>
>> 4c4
>> <  # Tue Feb  8 18:39:42 2011
>> ---
>>> # Thu Mar  3 17:35:09 2011
>> 352c352,353
>> <  # CONFIG_PM_RUNTIME is not set
>> ---
>>> CONFIG_PM_RUNTIME=y
>>> CONFIG_PM_OPS=y
>> 434a436
>>> CONFIG_PCIE_PME=y
>> 738c740
>> <  # CONFIG_FIRMWARE_IN_KERNEL is not set
>> ---
>>> CONFIG_FIRMWARE_IN_KERNEL=y
>> 1162a1165
>>> CONFIG_I2C_ALGOBIT=y
>> 1339,1343c1342
>> <  CONFIG_AGP=y
>> <  # CONFIG_AGP_AMD64 is not set
>> <  # CONFIG_AGP_INTEL is not set
>> <  # CONFIG_AGP_SIS is not set
>> <  # CONFIG_AGP_VIA is not set
>> ---
>>> # CONFIG_AGP is not set
>> 1347c1346,1355
>> <  # CONFIG_DRM is not set
>> ---
>>> CONFIG_DRM=y
>>> CONFIG_DRM_KMS_HELPER=y
>>> CONFIG_DRM_TTM=y
>>> # CONFIG_DRM_TDFX is not set
>>> # CONFIG_DRM_R128 is not set
>>> CONFIG_DRM_RADEON=y
>>> CONFIG_DRM_RADEON_KMS=y
>>> # CONFIG_DRM_MGA is not set
>>> # CONFIG_DRM_VIA is not set
>>> # CONFIG_DRM_SAVAGE is not set
>> 1350c1358,1415
>> <  # CONFIG_FB is not set
>> ---
>>> CONFIG_FB=y
>>> # CONFIG_FIRMWARE_EDID is not set
>>> # CONFIG_FB_DDC is not set
>>> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
>>> CONFIG_FB_CFB_FILLRECT=y
>>> CONFIG_FB_CFB_COPYAREA=y
>>> CONFIG_FB_CFB_IMAGEBLIT=y
>>> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
>>> # CONFIG_FB_SYS_FILLRECT is not set
>>> # CONFIG_FB_SYS_COPYAREA is not set
>>> # CONFIG_FB_SYS_IMAGEBLIT is not set
>>> # CONFIG_FB_FOREIGN_ENDIAN is not set
>>> # CONFIG_FB_SYS_FOPS is not set
>>> # CONFIG_FB_SVGALIB is not set
>>> # CONFIG_FB_MACMODES is not set
>>> # CONFIG_FB_BACKLIGHT is not set
>>> # CONFIG_FB_MODE_HELPERS is not set
>>> # CONFIG_FB_TILEBLITTING is not set
>>>
>>> #
>>> # Frame buffer hardware drivers
>>> #
>>> # CONFIG_FB_CIRRUS is not set
>>> # CONFIG_FB_PM2 is not set
>>> # CONFIG_FB_CYBER2000 is not set
>>> # CONFIG_FB_ARC is not set
>>> # CONFIG_FB_ASILIANT is not set
>>> # CONFIG_FB_IMSTT is not set
>>> # CONFIG_FB_VGA16 is not set
>>> # CONFIG_FB_VESA is not set
>>> # CONFIG_FB_N411 is not set
>>> # CONFIG_FB_HGA is not set
>>> # CONFIG_FB_S1D13XXX is not set
>>> # CONFIG_FB_NVIDIA is not set
>>> # CONFIG_FB_RIVA is not set
>>> # CONFIG_FB_LE80578 is not set
>>> # CONFIG_FB_MATROX is not set
>>> # CONFIG_FB_RADEON is not set
>>> # CONFIG_FB_ATY128 is not set
>>> # CONFIG_FB_ATY is not set
>>> # CONFIG_FB_S3 is not set
>>> # CONFIG_FB_SAVAGE is not set
>>> # CONFIG_FB_SIS is not set
>>> # CONFIG_FB_VIA is not set
>>> # CONFIG_FB_NEOMAGIC is not set
>>> # CONFIG_FB_KYRO is not set
>>> # CONFIG_FB_3DFX is not set
>>> # CONFIG_FB_VOODOO1 is not set
>>> # CONFIG_FB_VT8623 is not set
>>> # CONFIG_FB_TRIDENT is not set
>>> # CONFIG_FB_ARK is not set
>>> # CONFIG_FB_PM3 is not set
>>> # CONFIG_FB_CARMINE is not set
>>> # CONFIG_FB_GEODE is not set
>>> # CONFIG_FB_VIRTUAL is not set
>>> # CONFIG_FB_METRONOME is not set
>>> # CONFIG_FB_MB862XX is not set
>>> # CONFIG_FB_BROADSHEET is not set
>> 1364a1430,1437
>>> CONFIG_FRAMEBUFFER_CONSOLE=y
>>> # CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
>>> # CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
>>> # CONFIG_FB_CON_DECOR is not set
>>> # CONFIG_FONTS is not set
>>> CONFIG_FONT_8x8=y
>>> CONFIG_FONT_8x16=y
>>> # CONFIG_LOGO is not set
>> 1564a1638
>>> # CONFIG_USB_SUSPEND is not set
>>
>> I hope this helps
>>
>> Thanks
>> Dushan
>>
>> On Fri, Mar 4, 2011 at 7:37 PM, Edward Shishkin
>> <edward.shishkin@gmail.com>  wrote:
>>> On 03/04/2011 07:08 PM, Dushan Tcholich wrote:
>>>>
>>>> I captured kernel output with a mobile
>>>> camera.http://img854.imageshack.us/i/04032011.jpg/
>>>>
>>>>   Missing text says:
>>>> "reiser4_handle_error (fs/reiser4/vfs_ops.c:240)[foobar-42]
>>>>
>>>> It happened day after I enabled KMS in kernel for ati card, didn't
>>>> notice this problem earlier.
>>>>
>>>> It happened twice, once after ~12h uptime, next time after ~2h uptime.
>>>
>>>
>>> Could you please check kernel messages more carefully:
>>> are there complaints (IO errors, etc) of any low-level
>>> subsystem?
>>>
>>> Thanks,
>>> Edward.
>>>
>>>>
>>>> Nothing in /var/log/messages
>>>>
>>>> Have a nice day
>>>>
>>>> Dushan
>>>
>>>
>>

