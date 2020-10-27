From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: PROBLEM: Reiser4 hard lockup
Date: Tue, 27 Oct 2020 01:53:31 +0100
Message-ID: <2e2f8dc4-a48e-f09c-3f41-5dfa7f9a6387@gmail.com>
References: <20201025090422.D80F56FB40E1@huitzilopochtli.metztli-it.com>
 <20201025210758.034aa947@Phenom-II-x6.niklas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ruMA5nzaXoeFAnvA+h4f1K52oHp0phNfZLmBzayTOIk=;
        b=JmthtUqp1yozHGA/fnwa9FuqdjTxxtkEpg3acmm0Il/MCXUebcZFpS9yE9absYSFcI
         Ojo2ceuQQoFSUcNXYphdioA3WhEtSO04LW6P/KjdqkpyizpUYQLsFm/Cgm6nevNY/UPi
         2QhtvSumIXJXZJuHeXApB5gFHC9PSe+Cnn+H6fuTYgng5Zd4pYh1HEDtsTEMfSa4qJwd
         G96YZY7KFqE7rCadfbNGPVc4esXIVv5BeZbWIWwk+USFxOmUnJ/qd5tDpuMHeewMJBO9
         aIcY8W1tsH5jYl2K8dQhx/rJ8KGC3TCRLzsgCpGklvMmxpP7h8226Yj6XHnuqOejhtJu
         fhrw==
In-Reply-To: <20201025210758.034aa947@Phenom-II-x6.niklas.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Niklas <Hgntkwis@vfemail.net>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/26/2020 02:07 AM, David Niklas wrote:
> I'll reply to both of you in this email.
> 
> On Sun, 25 Oct 2020 02:04:22 -0700 (PDT)
> Metztli Information Technology <jose.r.r@metztli.com> wrote:
>> Niltze, David-
>>
>> A few observations are in order below:
>>
>> On Sat, Oct 24, 2020 at 1:39 PM David Niklas <Hgntkwis@vfemail.net>
>> wrote:
>>>
>>> Hello,
>>>
> <snip>
>> reiser4progs 1.1.x Software Framework Release Number (SFRN) 4.0.1 file
>> system utilities should not be used to check/fix media formatted 'a
>> priori' in SFRN 4.0.2 and vice-versa.
> 
> Honestly, this is the first time I've heard about a Linux FS having
> versioning other than a major one


This is because, unlike other Linux file systems, reiser4 is a
framework.

In vanilla kernel having a filesystem-as-framework is discouraged for
ideological reasons. As they explained: "nobody's interested in
plugins". A huge monolithic mess without any internal structure -
welcome :)
