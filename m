From: Metztli Information Technology <jose.r.r@metztli.com>
Subject: Re: partman, growlight, discoverable partitions, and fun
Date: Mon, 27 Sep 2021 08:10:39 -0700
Message-ID: <4801b78b-a934-f105-3238-e35cb3109745@metztli.com>
References: <YUzqHtJYGb0I0ZC3@schwarzgerat.orthanc>
 <eae892df-cfb6-20f0-5de9-17e4cdde49ab@physik.fu-berlin.de>
 <CANPPEmRV+1+yijo_dB=jtL+vnaD_8kVDeCDfL=ZcE6PzRZZuRw@mail.gmail.com>
 <48da69b9-7ded-19d5-c62e-b4ccc901e466@physik.fu-berlin.de>
 <YVCDuHu75/b64isw@schwarzgerat.orthanc>
 <a217aa68-644f-b80e-2a9d-e0dee6d5187a@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------730B58C4006216C438D90B06"
Return-path: <bounce-debian-boot=debian-boot=m.gmane-mx.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=tO37ydNM4DzwwSF+MPic1ewPwTRuD2BDGvy0wHFlN5M=;
        b=noIlv2m0zesYSf+1gUmrgenNIQeb3KrpD7Uy0JhQwZ40vNJGbbfDqktFmF1vlXyC8q
         GYKkdJR5idCXrTLuv2FXB2muilJ6fqLAtadPKWZv0Es5JcPYABkwZexa7KmR4/C6Pxfp
         3wIOUEbi2sj0IKLmFZfsC4wEqh8luYrBuxewNfnrXkzEGRZFHwm4ERziaCZXU7r7Qru4
         3Ink/lsYoIRisEQURSIE9k3MGJQlUsC0wvxAeo9ZjLj8rD+B/dsMYFFCCYb0FXdxFW7A
         WUL57MFv6hUeJCPxgzYGODAVFprdV/eCf4ySrQ0pQBDVV3PQnmJ72lSM6KLIBlPLG4Id
         m9FQ==
In-Reply-To: <a217aa68-644f-b80e-2a9d-e0dee6d5187a@physik.fu-berlin.de>
Content-Language: en-US
Resent-Message-ID: <BQZiuXNivwE.A.mVF.RLeUhB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-boot/>
List-Post: <mailto:debian-boot@lists.debian.org>
List-Help: <mailto:debian-boot-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-boot-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-boot-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/4801b78b-a934-f105-3238-e35cb3109745@metztli.com
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Nick Black <dankamongmen@gmail.com>
Cc: debian-boot@lists.debian.org, debian-devel@lists.debian.org, edward.shishkin@gmail.com, reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------730B58C4006216C438D90B06
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/27/21 4:01 AM, John Paul Adrian Glaubitz wrote:
> Hello Nick!
>
> On 9/26/21 16:29, Nick Black wrote:
>> I'd be delighted to support them -- as in, I am honestly eager
>> to add ATARI support; that sounds awesome -- I just need some
>> way to test the implementations, either via someone running it
>> on the environment, or getting access to such a machine.
> There are emulators available for Atari such as Aranym. And emulators
> available for Amiga such as fs-uae. FWIW, parted should contain everything
> needed to be able to implement your own support for these partition tables.
>
>>> I think it makes little sense to not use libparted as it already supports
>>> all common and less common partition types and reimplementing everything
>>> that libparted makes little sense to me.
>> parted did not have ZFS support when I embarked on this project
>> (it appears to have it now). i would not be opposed to
>> leveraging libparted if it presents a definite advantage;
>> supporting more partition types, so long as it exposes an API i
>> can easily work with, would be such an advantage.
> Well, using a missing feature in the past against parted that is present
> there is not such a good argument against using it, to be honest.
>
>> i do note that libparted2 is 621K in the archive, whereas
>> growlight itself is only 555K. it is of course possible that
>> all that weight is desirable functionality.
> I think 70k more disk space is not really a concern.
>
>> with that said, i would *still want to test on the target
>> environment*, to make sure i'm using libparted correctly there.
>> so that necessity remains.
> I thought you didn't depend on libparted?
>
>> would this allay your concerns?
> No, not really. I consider a partitioning tool to be too important
> to be replaced by an unproven solution.
>
Growlight seems like an adequate tool for Debian expert option as it has 
potential to enable additional flexibility and extensibility for file 
system options which may not offered in the current set of Parted 
utilities. For instance, the current Growlight string/option 'enter 
filesystem name' could be re-implemented, with a couple lines of code, 
into something like 'enter plugin override'

< https://metztli.it/bullseye/gl/gl-reiser4-plugin-override.png >

etc., for other filesystems.


Also Growlight may reduce at least a subset of UDEB modules needed for 
each file system supported by Debian, thus reducing complexity. For 
instance, it was relatively straightforward to add support for reiser4 
-- as compared to initial efforts developing substantial code for a 
partman-[filesystem] UDEB module.

< https://metztli.it/bullseye/gl/growlight-reiser4.png >

In other words, even if there is no compelling reason to update d-i at 
the moment, Growlight has potential to decrease complexity in the long run.

Just a point of view from an outsider, of course, I do not want anyone 
'to have a cow' for refusing to potentially move away from their place 
of comfort and/or entertaining a perspective that may be considered 'taboo.'


Best Professional Regards.

-- 

Jose R R
http://metztli.it <http://metztli.it>
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.13.14 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/ 
<https://sf.net/projects/metztli-reiser4/>
---------------------------------------------------------------------------------------------
or SFRN 5.1.3, Metztli Reiser5 https://sf.net/projects/debian-reiser4/ 
<https://sf.net/projects/debian-reiser4/>
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/ 
<https://reiser4.wiki.kernel.org/>

--------------730B58C4006216C438D90B06
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/27/21 4:01 AM, John Paul Adrian
      Glaubitz wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a217aa68-644f-b80e-2a9d-e0dee6d5187a@physik.fu-berlin.de">
      <pre class="moz-quote-pre" wrap="">Hello Nick!

On 9/26/21 16:29, Nick Black wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I'd be delighted to support them -- as in, I am honestly eager
to add ATARI support; that sounds awesome -- I just need some
way to test the implementations, either via someone running it
on the environment, or getting access to such a machine.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There are emulators available for Atari such as Aranym. And emulators
available for Amiga such as fs-uae. FWIW, parted should contain everything
needed to be able to implement your own support for these partition tables.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I think it makes little sense to not use libparted as it already supports
all common and less common partition types and reimplementing everything
that libparted makes little sense to me.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
parted did not have ZFS support when I embarked on this project
(it appears to have it now). i would not be opposed to
leveraging libparted if it presents a definite advantage;
supporting more partition types, so long as it exposes an API i
can easily work with, would be such an advantage.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, using a missing feature in the past against parted that is present
there is not such a good argument against using it, to be honest.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">i do note that libparted2 is 621K in the archive, whereas
growlight itself is only 555K. it is of course possible that
all that weight is desirable functionality.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think 70k more disk space is not really a concern.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">with that said, i would *still want to test on the target
environment*, to make sure i'm using libparted correctly there.
so that necessity remains.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I thought you didn't depend on libparted?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">would this allay your concerns?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No, not really. I consider a partitioning tool to be too important
to be replaced by an unproven solution.

</pre>
    </blockquote>
    <p>Growlight seems like an adequate tool for Debian expert option as
      it has potential to enable additional flexibility and
      extensibility for file system options which may not offered in the
      current set of Parted utilities. For instance, the current
      Growlight string/option 'enter filesystem name' could be
      re-implemented, with a couple lines of code, into something like
      'enter plugin override'</p>
    <p><a class="moz-txt-link-rfc2396E" href="https://metztli.it/bullseye/gl/gl-reiser4-plugin-override.png">&lt;
      https://metztli.it/bullseye/gl/gl-reiser4-plugin-override.png &gt;</a></p>
    <p>etc., for other filesystems.<br>
    </p>
    <p><br>
    </p>
    <p> Also Growlight may reduce at least a subset of UDEB modules
      needed for each file system supported by Debian, thus reducing
      complexity. For instance, it was relatively straightforward to add
      support for reiser4 -- as compared to initial efforts developing
      substantial code for a partman-[filesystem] UDEB module.<br>
    </p>
    <p><a class="moz-txt-link-rfc2396E" href="https://metztli.it/bullseye/gl/growlight-reiser4.png">&lt; https://metztli.it/bullseye/gl/growlight-reiser4.png &gt;</a><br>
    </p>
    <p>In other words, even if there is no compelling reason to update
      d-i at the moment, Growlight has potential to decrease complexity
      in the long run.</p>
    <p>Just a point of view from an outsider, of course, I do not want
      anyone 'to have a cow' for refusing to potentially move away from
      their place of comfort and/or entertaining a perspective that may
      be considered 'taboo.'</p>
    <p><br>
    </p>
    <p>Best Professional Regards.</p>
    <p>-- <br>
    </p>
    <div dir="ltr" class="gmail_signature"
      data-smartmail="gmail_signature">
      <div dir="ltr">
        <div>
          <div dir="ltr">
            <div>
              <div dir="ltr">
                <div>
                  <div dir="ltr">
                    <div>
                      <div dir="ltr">
                        <div>
                          <div dir="ltr">
                            <div>
                              <div dir="ltr">
                                <div>Jose R R<br>
                                  <a href="http://metztli.it"
                                    target="_blank">http://metztli.it</a><br>
---------------------------------------------------------------------------------------------<br>
                                  Download Metztli Reiser4: Debian
                                  Buster w/ Linux 5.13.14 AMD64<br>
---------------------------------------------------------------------------------------------<br>
                                  feats ZSTD compression <a
                                    href="https://sf.net/projects/metztli-reiser4/"
                                    target="_blank">https://sf.net/projects/metztli-reiser4/</a><br>
                                  <font color="#888888">---------------------------------------------------------------------------------------------<br>
                                    or SFRN 5.1.3, Metztli Reiser5 <a
                                      href="https://sf.net/projects/debian-reiser4/"
                                      rel="noreferrer" target="_blank">https://sf.net/projects/debian-reiser4/</a></font><br>
-------------------------------------------------------------------------------------------<br>
                                  Official current Reiser4 resources: <a
href="https://reiser4.wiki.kernel.org/" target="_blank">https://reiser4.wiki.kernel.org/</a></div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

--------------730B58C4006216C438D90B06--

