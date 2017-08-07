From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Debian Linux Reiser4 -patched Kernel 4.11.12 EOL source
Date: Mon, 7 Aug 2017 11:47:55 +0200
Message-ID: <8df9a663-dea9-caca-0326-7aa9b0d8c95e@gmail.com>
References: <20170807091136.942E8C7B91F@mictlantecuhtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=0RjoTK8KHYZpYheG4fudq3tBNzKEBJq2zvOwFwaMdZg=;
        b=BhnkIal2JWtgOViHjpxkaAg5GW0vAoms0YF7nFGbpoW0weskqfOuZN18mD6LH+3npa
         VLqZvkybQFQWB1EHFnExTGqjRUn3VInmnyq06fM6K1L8EUfzB/uGfVckF4nQTWAgEJKm
         R1xSOmaINZmxiffOxD+BK9kMmChBKHkreK5+oSe53aGqDxfG+5HyIdiWrrSEBqpT3D4N
         a/UW9o0pkKOO8J/NQuEI6W1EtNBHhJ1QCKjFMdQd8IUrUP2xBWKEezwYScVc9kPjlAQk
         PeEftBJON/6ubwQRTUiqpWueDxvdRxy8rKZ3ytsY9Z94Ay8D4U3UKo5iVKescOtipdkD
         WhJg==
In-Reply-To: <20170807091136.942E8C7B91F@mictlantecuhtli.metztli-it.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Jose R Rodriguez <jose@mictlantecuhtli.metztli-it.com>, reiserfs-devel@vger.kernel.org

Yes, rootfs it is one of the best patterns for default mode.

But the most impressive performance numbers can be observed
on a set of well-squeezable files, if you compress files with only
even (or only odd) object IDs (and pass management to unix-file
plugin for other files). This phenomenon is not yet investigated.

Edward.

On 08/07/2017 11:11 AM, Jose R Rodriguez wrote:
> Niltze, all-
>
> Here is a link for reiser4 -patched kernel 4.11.12 end of life (EOL) sour=
ce that I used to generate UDEB reiser4 modules, etc. for latest Metztli Re=
iser4 debian 9.1 Stretch netboot:
> < https://sourceforge.net/p/metztli-reiser4/code/ >
>
> Please note that upstream 4.11.12-for-4.11.11 patch was applied to debian=
 kernel 4.11.11-1 and wrapped in its complementing version packaging =E2=80=
=93 all hacked for smooth installation of pertinent patches.
>
> I have local and Google cloud Metztli Reiser4 instances running with abov=
e kernel.
>
> For the cloud this time I decided to try creating an image with (default)=
 transparent compression reiser4 root fs. What surprised me is how fast and=
 efficient the reiser4 transparent compression image performs in the Google=
 cloud instance. I was expecting a noticeable performance penalty but so fa=
r it's extremely fast. I am still testing:
> < https://metztli.it/readOnlyEphemeral/gce-reiser4_transparent-compressio=
n.png >
>
> After local creation in VirtualBox and subsequent preparation and optimiz=
ation for the Google Compute Engine (GCE), the image is tarred and uploaded=
 to a Google storage repository - from there the image is added (via local =
SDK or web console) to an image debian family in one's project.
>
> If anyone is interested in the reiser4 transparent compression tarred ima=
ge ~500MB for their Google Compute Engine project, please let me know.
>
>
> Best Professional Regards.
>
>

