From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Integrate fully partman-reiser4 into d-i
Date: Sat, 28 Nov 2015 05:48:42 -0800
Message-ID: <CAM12Q5SvUEnKiok+V-ify4xQnP1p_gGBNmnvqf55MqmGTqJSQw@mail.gmail.com>
References: <CAM12Q5QKdpHgMG_qGyhE-abO6R-uY6cKtv-5Qg36N-FTx_Z8Lw@mail.gmail.com>
	<CAM12Q5Q2GQSqE2ehj2dAmkq4ffP=x3__F76dH7KOey=vVAkQOA@mail.gmail.com>
	<20150921111209.GA30565@riva.ucam.org>
	<560018DE.9010205@gmail.com>
	<CAM12Q5TDHYYGsVyo8URe58iF99nRQoxzjs1-JkuAsiP1rvd0Vw@mail.gmail.com>
	<5644BCF4.3040908@gmail.com>
	<CAM12Q5RQJF3zWg9TPDCMx-MDso9XXBWC+XApy3SknY_GBmHF-A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=5rcY1N5UNCJW1rv3iXnr3aoJYg1UDZ/+dV1Zmq0+S7k=;
        b=GzHabeXP1ojlno2oLes+XNpMGT31oSEHUISnW+F49yRb4YDsYt/mVI16iM6sqsjbeV
         pye4AIEcVZC2QRxAGUteikwyrp/QPKLaisnTkGUpJmrO3uHwWAjBMYKGQ04sO7FrRGnh
         7kkeAjk/Sdr1inKeR3vhGGMHdvPt1kdCB0AbkvWb3rmO94l6f7mwNJ4P5QYwV/KZJz8b
         4YGD4H0P6NwkFpBgh+vrEAVfLCNzLBor6hcMcVso68Xp/EuAoqcqeMKF3/zCcbu96q/Q
         FMMgiACbRFDbt01xQbVPddrc3y4TFqL7kb0gvKE5z+FuPorzLD4WlzTzTRsC7Oyo/oWl
         DGGQ==
In-Reply-To: <CAM12Q5RQJF3zWg9TPDCMx-MDso9XXBWC+XApy3SknY_GBmHF-A@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Cyril Brulebois <kibi@debian.org>, Ben Hutchings <ben@decadent.org.uk>, cjwatson@debian.org, debian-cloud <debian-cloud@lists.debian.org>

Niltze, everyone!

On Mon, Nov 16, 2015 at 7:37 AM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> I hacked (literally) a preliminary version of the of GNU Parted 3.2
> source with Reiser4 support.
>
> On Thu, Nov 12, 2015 at 8:23 AM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>>
>>
>> On 11/12/2015 12:28 PM, Jose R R wrote:
>>>
>>> On Mon, Sep 21, 2015 at 7:49 AM, Edward Shishkin
>>> <edward.shishkin@gmail.com> wrote:
>>>>
>>>> On 09/21/2015 01:12 PM, Colin Watson wrote:
>>>>>
>>>>> On Sun, Sep 20, 2015 at 07:40:37AM -0700, Jose R R wrote:
>>>>>>
>>>>>> I have realized that although partman-reiser4 udeb enables Reiser4 to
>>>>>> be listed as an option during the Debian-Installer routine of a
>>>>>> netboot ISO image, the lack of support for reiser4 in GNU Parted
>>>>>> (Debian's libparted) prevents installation from the GUI interface.
>>>>>
>>>>> It should be pretty easy to add that to parted, since nowadays the only
>>>>> filesystem support it has is probing support.  I suggest preparing a
>>>>> patch against git://git.sv.gnu.org/parted.git master that adds the
>>>>> ability to detect existing reiser4 partitions and sending it upstream;
>>>>> it should only be on the order of a hundred lines.
>>>>
>>>>
>>>>
>>>> Does anybody care to prepare the patch?
>>>
>>> I am working on it Ed. I have been ironing out some wrinkles from the
>>> last Reiser4 patch proposed several years ago in the GNU Parted
>>> mailing lists. It's components and structure were basically cloned by
>>> the initial btrfs patch submitted to Debian. autoreconf has been my
>>> friend ;-)
>>>
>>>> I think we just need to a read a sector at REISER4_MAGIC_OFFSET
>>>> and check the magic string ("ReIsEr4"), see definition of the struct
>>>> reiser4_master_sb.
>>>
>>> Please enlighten me with reference to its documentation -- online or
>>> in the Reiser4 source code?
>>
>>
>> Alas, only source code..
>>
>> In reiser4 kernel sources look for REISER4_MAGIC_OFFSET
>> and REISER4_SUPER_MAGIC_STRING.
>>
>> In reiser4progs it is called REISER4_MASTER_OFFSET and
>> REISER4_MASTER_MAGIC respectively.
>>
>
> It can be built with the usual:
>
> apt-get install libdevmapper-dev
>
> ./configure [ --prefix=/opt/parted-3.2/usr/local ]
> make
> make install
>
> The resulting parted binary recognizes Reiser4 partitions when invoked
> at your shell:
> $ parted
> GNU Parted 3.2
> Using /dev/xda
> Welcome to GNU Parted! Type 'help' to view a list of commands.
> (parted) print
> And it will print recognized partitions -- including reiser4, of course.
>
> Although it was developed and tested in a local machine,
> I ran PoC build on small Google Compute Engine (GCE) Cloud instance
> with a couple of existing Reiser4 partitions:
>
> Snapshot:
> https://pbs.twimg.com/media/CT8U78zUwAE-ZTc.png:large
>
> Here is GNU Parted 3.2 bz2-compressed src modified for Reiser4 (in
> case I no longer have time to improve it ;-)
> Source: 2.6M reiser4-parted-3.2m.tar.bz2 @
> http://metztli.it/readOnlyEphemeral/reiser4-parted-3.2m.tar.bz2
> SHA256SUM:
> http://metztli.it/readOnlyEphemeral/reiser4-parted-3.2m.tar.bz2.SHA256SUM
>
>

Just to thank all of you for your insightful input on my quest to
create a Debian-Installer (d-i) network ISO image --hacked to natively
partition, format, and install in/to Reiser4 regular and/or
flash-based media.

As mentioned before, I hacked GNU Parted 3.2 to provide Reiser4
*string probe* support only. Subsequently generated appropriate UDEBs:

libparted2-udeb_3.2-10_amd64.udeb
parted-udeb_3.2-10_amd64.udeb
libparted-fs-resize0-udeb_3.2-10_amd64.udeb

By including the above in d-i, I would not get the weird gibberish
when selecting to format root (/) partition in Reiser4 during expert
installation. Notwithstanding, I encountered subsequent error and
thus...

I modified partman-reiser4-1, (yes again) last evening -- since I was
getting something similar to: "debian-installer: Installation freezes
with "The attempt to mount a files system with type ext4 in SCSI1 (0,
0, 0), partition #1 (sda) at / failed." <
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=779922 > but, of
course, with reiser4 instead of ext4. Afterwards, I generated another
partman-reiser4_1_all.udeb

At this very moment the native Reiser4 installation is proceeding in a
VirtualBox instance. I did not have to do any unusual hacks to make
the Reiser4-based installation to proceed. Hence my quest seems over
-- as I attained my objective:

Here is an initial splash screenshot of the custom d-i installer:

< https://pbs.twimg.com/media/CU5exc0UcAAZmd4.png:large >

Needless to say, this is only a working instance and I will respect
the Debian logo by removing it from the image-generating template.

And here is the /etc/fstab that was created by the installer at the
/target/etc/fstab ephemeral installation location:

< https://pbs.twimg.com/media/CU5euw6VEAA8ZGz.png:large >

d-i partman component recognized and honored Reiser4! :D

This native Reiser4 Debian-Installer simplifies my tasks -- as in the
past I went through much pain creating a template for Google Cloud
Engine (GCE) image instances based on Reiser4.

Once again, I offer you all my sincere thanks.


Best Professional Regards.

P.S. Yes, I have to provide an alternate source and/or repository
where the Reiser4-patched Linux kernel image may be fetched during the
Debian installation but thats relatively easy.

Additionally, although I am not involved in Debian in any way --except
as a user, I would not mind contributing to Reiser4 maintenance if
mainstream Debian developers decide to include Reiser4 support in
their regular vanilla distribution. Yes, I will submit the
Reiser4-patch to GNU Parted, later on.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
