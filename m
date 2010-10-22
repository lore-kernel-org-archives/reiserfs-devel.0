From: Viji V Nair <viji@fedoraproject.org>
Subject: Re: reiser4 as a module
Date: Fri, 22 Oct 2010 22:08:13 +0530
Message-ID: <AANLkTinndP10_1-bvx4h5Wz5-3i8=M3FCep6kB-=bSi9@mail.gmail.com>
References: <AANLkTi=o5bXDxY4XKSYzcX9fX4yHZRC68=oMk0sikViS@mail.gmail.com>
 <4CC18948.5020500@ontolinux.com> <AANLkTin5Rq_Spo-+oJWKvN9tSOUo=iD9CicRWxmWB-R6@mail.gmail.com>
 <4CC1B9AE.1030605@ontolinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=bT7X+MryQlw1hv5rbbsC9FiEpbCsGXxgATb3SRXi22k=;
        b=mn4Gav1mlY/djafgQbrPEHiUvR85aRGUSfu1RpIZMw2nt2+Z5l9P27D5R4UbugVq+/
         D9GykdESJm0zQNo1oL7Re0HVjQViAm5wzmfb9N6WwXhQw1eSwKCASMrLjTVpjbfoAELW
         mqtqVCZrH8+hicUXFZCB33vrhVdiwak0IbJxo=
In-Reply-To: <4CC1B9AE.1030605@ontolinux.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Stroetmann <stroetmann@ontolinux.com>
Cc: linux reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi

On Fri, Oct 22, 2010 at 9:49 PM, Christian Stroetmann
<stroetmann@ontolinux.com> wrote:
> =A0Thanks for further informations.
>
> On the 22.10.2010 17:46, Viji V Nair wrote:
>>
>> Hi
>>
>> On Fri, Oct 22, 2010 at 6:23 PM, Christian Stroetmann
>> <stroetmann@ontolinux.com> =A0wrote:
>>>
>>> =A0Hola;
>>>
>>> On the 22.10.2010 12:02, Viji V Nair wrote:
>>>>
>>>> Hi,
>>>>
>>>> I have been trying to build reiser4 as a module, but the module wh=
ich
>>>> is getting compiled having the "symbol" issue.
>>>>
>>>> <snip>
>>>> reiser4: Unknown symbol lzo1x_1_compress
>>>> reiser4: Unknown symbol might_fault
>>>> reiser4: Unknown symbol mutex_lock_nested
>>>> reiser4: Unknown symbol zlib_deflate
>>>> reiser4: Unknown symbol writeback_inodes_wbc
>>>> </snip>
>>>
>>> You mentioned this problem in the thread [1] as well.
>>> Check your pathes.
>>
>> Nobody replied to that thread :). I am planning to push reiser4 in t=
he
>> fedora official repository.
>> I have checked the paths, looks fine. Even I tried with some other
>> modules (cifs) and those are getting compiled and loads with out any
>> issue.
>
> This is surprising. Maybe it is in the scripts of the compilation too=
lchain
> (configure, make, and so on).
>>>>
>>>> I could see from the reiser4 2.6.34 patch that it is adding
>>>> "EXPORT_SYMBOL" to few files in fs& =A0 =A0mm directories of the k=
ernel
>>>> source tree. Can we have all these symbols defined in the core sou=
rce
>>>> tree of resier4 also? Do we have a patch for this already?
>>>
>>> For what? See above.
>
> I still believe that they belong to the files in the fs and mm direct=
ories
> of the kernel source tree.
>
> Also somehow fuzzy, the fault messages you have sent are referencing
> existing items that are contained in the unpatched/original libraries=
=2E Are
> the missing symbols related with the ones that are included in the R4=
 2.6.34
> patch?
>
> So, maybe you should take a second and wait for the comments by the
> maintainer about the "EXPORT_SYMBOL" point.
>>>
>>> Btw.: To be honest, I find it a little bit off-topic, because it's =
about
>>> compiling a kernel module and not a R4 issue.
>>
>> This was working fine untill 2.6.10 patch. You can find the same iss=
ue
>> in Open Suse/Ubuntu/Mandriva mailing lists.
>
> Ah, okay. Good to know this.
>>
>> The missing symbols need to exported in the module level, I think. I=
f
>> I compile the kernel completely everything works fine, but that is n=
ot
>> I want. I dont want to disturb the stock kernel.
>
> Okay.
> I still guess the problem is in the scripts that compile the module, =
if you
> say that compiling kernel modules with other file systems and the com=
plete
> kernel with R4 support works correctly. Compare the scipts that are u=
sed to
> compile the complete kernel with R4 support with the scripts of the R=
4
> kernel module compilation. There must be the searched difference.

You are right, I am digging into the fedora kernel source tree, some
scripts are exporting all these symbols globally on a complete
compilation of the kernel. Need to figure out which one, anyway, for
resier4 we should have this symbol exported separately to avoid the
dependency with the above scripts.

>>>>
>>>> Thanks
>>>> Viji
>>>
>>> [1] Compilation Issue - Reiser4
>>> http://www.spinics.net/lists/reiserfs-devel/msg02508.html
>>>
>>> Have fun
>>> Christian O>-< =A0 =A0 *<:o) =A0 _(D)>-<
>>>
>> Thank you so much for your support
>>
>> Viji
>
> Good luck
> Christian O>-< =A0 *<:o) =A0 _(D)>-<
>

Thanks
Viji
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
