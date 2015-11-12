From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Integrate fully partman-reiser4 into d-i
Date: Thu, 12 Nov 2015 03:28:29 -0800
Message-ID: <CAM12Q5TDHYYGsVyo8URe58iF99nRQoxzjs1-JkuAsiP1rvd0Vw@mail.gmail.com>
References: <CAM12Q5QKdpHgMG_qGyhE-abO6R-uY6cKtv-5Qg36N-FTx_Z8Lw@mail.gmail.com>
	<CAM12Q5Q2GQSqE2ehj2dAmkq4ffP=x3__F76dH7KOey=vVAkQOA@mail.gmail.com>
	<20150921111209.GA30565@riva.ucam.org>
	<560018DE.9010205@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli_com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=E6bQ00SK0JtgvsHUu1w5gWTKwX+JAEunp+1TWtbHI4k=;
        b=hBXCH1zlyCT7jix5cf6jpcSWKF5Wn0onxnJYEnFPxu8DErkaHy3PJWQqTCELQJF3hz
         f+1Juvi5yfIR/bNWA5FdkvrxoeMOCalIAhrS5o7oiGb1gWI+6yYDN1CZkvZdW3VaRV8i
         9dAtpYgg5i9wCqshT/ITIvXlIphQA0ZWL5cQ4z6/VJAoSr0TajLy42TzHehA5gVr2bCo
         Jukf9naArjxsH1EDr4jShXIzM6xA84sTAaX7ybLP8SfK3rbviAkyPZDMGucnd5wpzdrJ
         qwtxywMyjT3hsXLlJ8FLFy0zsGdEMObHbHKlvPJHITajzAI/DFVmnb9p7l1RM54NB37P
         WopA==
In-Reply-To: <560018DE.9010205@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Cyril Brulebois <kibi@debian.org>, Ben Hutchings <ben@decadent.org.uk>, cjwatson@debian.org

On Mon, Sep 21, 2015 at 7:49 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 09/21/2015 01:12 PM, Colin Watson wrote:
>>
>> On Sun, Sep 20, 2015 at 07:40:37AM -0700, Jose R R wrote:
>>>
>>> I have realized that although partman-reiser4 udeb enables Reiser4 to
>>> be listed as an option during the Debian-Installer routine of a
>>> netboot ISO image, the lack of support for reiser4 in GNU Parted
>>> (Debian's libparted) prevents installation from the GUI interface.
>>
>> It should be pretty easy to add that to parted, since nowadays the only
>> filesystem support it has is probing support.  I suggest preparing a
>> patch against git://git.sv.gnu.org/parted.git master that adds the
>> ability to detect existing reiser4 partitions and sending it upstream;
>> it should only be on the order of a hundred lines.
>
>
>
> Does anybody care to prepare the patch?
I am working on it Ed. I have been ironing out some wrinkles from the
last Reiser4 patch proposed several years ago in the GNU Parted
mailing lists. It's components and structure were basically cloned by
the initial btrfs patch submitted to Debian. autoreconf has been my
friend ;-)

> I think we just need to a read a sector at REISER4_MAGIC_OFFSET
> and check the magic string ("ReIsEr4"), see definition of the struct
> reiser4_master_sb.
Please enlighten me with reference to its documentation -- online or
in the Reiser4 source code?

>> I'd be happy to cherry-pick such a patch into the Debian packaging once
>> it has been committed upstream.
>>
>
Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
