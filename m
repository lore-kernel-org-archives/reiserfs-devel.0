From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: help wanted add-node41.patch fails to apply to reiser4progs
 version 1.0.9
Date: Thu, 19 Feb 2015 07:34:33 -0800
Message-ID: <CAM12Q5R_662CF8HLBJv9m48e4gGLExCyHtUX1LZ5O-SDdmTyRw@mail.gmail.com>
References: <a6ad8c02cd6dcddc95b2d7e25d42f35c@mail.velocitynet.com.au>
	<CAM12Q5R3HCPNjL+wnX6wqXfbCM9F1n_cLLD2rGQcGLgM8Soxew@mail.gmail.com>
	<cb14e1389131b5cb6ed38b89ed0bf005@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <cb14e1389131b5cb6ed38b89ed0bf005@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Thu, Feb 19, 2015 at 6:01 AM,  <doiggl@velocitynet.com.au> wrote:
>
>> Steps were:
>>
>> autoreconf
>> ./configure
>> make
>> make install
>>
>> http://marc.info/?l=reiserfs-devel&m=142426774807698&w=2
>>
>> thus, likely you overlooked the first directive -- as Ed suggested:
>>
>> "try autoreconf before ./configure"
>>
>> http://marc.info/?l=reiserfs-devel&m=142419259318629&w=2
>>
>>
>> Best Professional Regards.
>
> Hello,
> Interestingly the spec file needs to have in it somewhere to allow it to
> run:
>
> autoreconf
>
> This needs a BuildRequires: <packagename> to enable the command
> 'autoreconf' to run.

I am not familiar with the OpenSuSE online build environment. Ask in
their forums and/or read their documentation to figure out how to add
the autoreconf directive so that your build can succeed.

Good luck!

-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
