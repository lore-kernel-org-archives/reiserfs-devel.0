From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Integrate fully partman-reiser4 into d-i
Date: Mon, 16 Nov 2015 07:37:07 -0800
Message-ID: <CAM12Q5RQJF3zWg9TPDCMx-MDso9XXBWC+XApy3SknY_GBmHF-A@mail.gmail.com>
References: <CAM12Q5QKdpHgMG_qGyhE-abO6R-uY6cKtv-5Qg36N-FTx_Z8Lw@mail.gmail.com>
	<CAM12Q5Q2GQSqE2ehj2dAmkq4ffP=x3__F76dH7KOey=vVAkQOA@mail.gmail.com>
	<20150921111209.GA30565@riva.ucam.org>
	<560018DE.9010205@gmail.com>
	<CAM12Q5TDHYYGsVyo8URe58iF99nRQoxzjs1-JkuAsiP1rvd0Vw@mail.gmail.com>
	<5644BCF4.3040908@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli_com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=VIYxjIC6k+vEXXtJxf4vIPLova4MSeW53koXqPPxrY0=;
        b=LzV7NMvABFpENJkQgDVZdgnPtIMr/eFEy4dnfcHXfkf1fSJPmDafqqWvAkJFhwl+A6
         xnDei3W/DAuIxwwKfEiN6oVl4UCATAeL34+3knKNCuXszAJ2wtSdQMKxEZFvRr2YHzon
         ayl4HMNq+iQuFBm8eQ4sHBjKO80S0FYZakYjXs9zupBrbYfaLf2ZIthwmJ9bJ99Ijyy0
         h9aGK5JmKSATzjOl1xlHz4fn1lqplXBLi+8YwSs6QfyTaO/yIUaV9MD/hQLzew7x36pk
         FlZKdsRdAj6+AkTp5LNbfu4xSaiaBQwXEneaJSN8sVmly8HNk7LO/IQv+7oMKMmIgK9j
         A0wQ==
In-Reply-To: <5644BCF4.3040908@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Cyril Brulebois <kibi@debian.org>, Ben Hutchings <ben@decadent.org.uk>, cjwatson@debian.org

I hacked (literally) a preliminary version of the of GNU Parted 3.2
source with Reiser4 support.

On Thu, Nov 12, 2015 at 8:23 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
>
>
> On 11/12/2015 12:28 PM, Jose R R wrote:
>>
>> On Mon, Sep 21, 2015 at 7:49 AM, Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>>
>>> On 09/21/2015 01:12 PM, Colin Watson wrote:
>>>>
>>>> On Sun, Sep 20, 2015 at 07:40:37AM -0700, Jose R R wrote:
>>>>>
>>>>> I have realized that although partman-reiser4 udeb enables Reiser4 to
>>>>> be listed as an option during the Debian-Installer routine of a
>>>>> netboot ISO image, the lack of support for reiser4 in GNU Parted
>>>>> (Debian's libparted) prevents installation from the GUI interface.
>>>>
>>>> It should be pretty easy to add that to parted, since nowadays the only
>>>> filesystem support it has is probing support.  I suggest preparing a
>>>> patch against git://git.sv.gnu.org/parted.git master that adds the
>>>> ability to detect existing reiser4 partitions and sending it upstream;
>>>> it should only be on the order of a hundred lines.
>>>
>>>
>>>
>>> Does anybody care to prepare the patch?
>>
>> I am working on it Ed. I have been ironing out some wrinkles from the
>> last Reiser4 patch proposed several years ago in the GNU Parted
>> mailing lists. It's components and structure were basically cloned by
>> the initial btrfs patch submitted to Debian. autoreconf has been my
>> friend ;-)
>>
>>> I think we just need to a read a sector at REISER4_MAGIC_OFFSET
>>> and check the magic string ("ReIsEr4"), see definition of the struct
>>> reiser4_master_sb.
>>
>> Please enlighten me with reference to its documentation -- online or
>> in the Reiser4 source code?
>
>
> Alas, only source code..
>
> In reiser4 kernel sources look for REISER4_MAGIC_OFFSET
> and REISER4_SUPER_MAGIC_STRING.
>
> In reiser4progs it is called REISER4_MASTER_OFFSET and
> REISER4_MASTER_MAGIC respectively.
>

It can be built with the usual:

apt-get install libdevmapper-dev

./configure [ --prefix=/opt/parted-3.2/usr/local ]
make
make install

The resulting parted binary recognizes Reiser4 partitions when invoked
at your shell:
$ parted
GNU Parted 3.2
Using /dev/xda
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) print
And it will print recognized partitions -- including reiser4, of course.

Although it was developed and tested in a local machine,
I ran PoC build on small Google Compute Engine (GCE) Cloud instance
with a couple of existing Reiser4 partitions:

Snapshot:
https://pbs.twimg.com/media/CT8U78zUwAE-ZTc.png:large

Here is GNU Parted 3.2 bz2-compressed src modified for Reiser4 (in
case I no longer have time to improve it ;-)
Source: 2.6M reiser4-parted-3.2m.tar.bz2 @
http://metztli.it/readOnlyEphemeral/reiser4-parted-3.2m.tar.bz2
SHA256SUM:
http://metztli.it/readOnlyEphemeral/reiser4-parted-3.2m.tar.bz2.SHA256SUM


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
