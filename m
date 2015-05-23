From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Debian cloud reiser4-patched kernel 3.19.8 [EOL] instance
Date: Sat, 23 May 2015 02:39:18 -0700
Message-ID: <CAM12Q5S4zF9bhEFkA5C6Ta32UBuk7_2dGqhyphCV=0_xirDqtg@mail.gmail.com>
References: <CAM12Q5Qa6okHrZmeT=u6fqfHqgQeRLSZk8Eth9j0aiYHsQr41Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5Qa6okHrZmeT=u6fqfHqgQeRLSZk8Eth9j0aiYHsQr41Q@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-cloud <debian-cloud@lists.debian.org>, Debian Release <debian-release@lists.debian.org>

Niltze, all (again ;-)

I have made public a Google Compute Engine (GCE) archive with a Debian
8 Jessie AMD64 running a Reiser4-patched Linux kernel 3.19.8 EOL:
< http://storage.googleapis.com/ome-teotl-caxitl/metztli_it_jessie_reiser4_mixtli_gce_1.tar.gz
>

If you have a GCE account and you want to give the image a spin (I
welcome feedback ;-) , you can can create your image from that source
archive thus (assuming you have the SDK):

gcloud compute images create [metztli-it-jessie-reiser4-amd64-gce-1]
--source-uri  gs://ome-teotl-caxitl/metztli_it_jessie_reiser4_mixtli_gce_1.tar.gz

Note that you may provide an alternate [name] within the brackets
above for your image; my suggestion is only to have a descriptive name
for you to remember what is it. And please *do not* include the
brackets ;-) in the command.

Subsequently you can create your first instance from the image named
above as follows:

gcloud compute instances create [your-instance-name] --image
metztli-it-jessie-reiser4-amd64-gce-1 --machine-type [f1-micro ||
g1-small] --zone [*]

where you select either f1-micro (approximately 600MB RAM
OR g1-small

For additional machine types, type:

gcloud compute machine-types list
...
n1-standard-1  us-central1-f  1     3.75  <-(this is the default if no
machine-type is specified)
n1-standard-16 us-central1-f  16   60.00
n1-standard-2  us-central1-f  2     7.50
n1-standard-32 us-central1-f  32   120.00
n1-standard-4  us-central1-f  4    15.00
n1-standard-8  us-central1-f  8    30.00

but please do not include the brackets.

Additionally replace [*] with your preferred zone as listed by command:

gcloud compute zones list
NAME           REGION       STATUS NEXT_MAINTENANCE TURNDOWN_DATE
asia-east1-c       asia-east1     UP
asia-east1-b       asia-east1     UP
asia-east1-a       asia-east1     UP
europe-west1-d   europe-west1 UP
europe-west1-b   europe-west1 UP
europe-west1-c   europe-west1 UP
us-central1-f       us-central1     UP
us-central1-b      us-central1     UP
us-central1-c      us-central1     UP
us-central1-a      us-central1     UP

Subsequently login into your newly created GCE Debian 8 AMD64 Reiser4 root fs:

gcloud compute ssh  [your-instance-name] --zone [your selected zone]


performing an df -hT you will see that your /boot partition is ext2
and your / partition is reiser4 fs :)

https://cloud.google.com/compute/

Enjoy!


Best Professional Regards.

On Mon, May 18, 2015 at 10:38 AM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> Niltze, all-
>
> Based on .config from Debian Jessie:
> linux-image-3.16.0-4-amd64   3.16.7-ckt9-3~deb8u1 amd64 Linux 3.16 for
> 64-bit PCs
> I have applied reiser4 for kernel 3.19.5 patch to pristine kernel
> 3.19.8 End Of Life.
>
> I have uploaded the image to Google Compute Cloud GCE <
> https://cloud.google.com/ > for testing purposes.
>
> Thus far, reiser4 on root fs with an ext2 /boot seems to be cool on a
> micro-instance (~600MB RAM small ;-) to save on charges
>
> https://pbs.twimg.com/media/CFTgMwrUkAAbwav.png:large
>
> If the image continues fine and there is interest I will make the
> image public in case other people may find it useful.
>
> Best Professional Regards.
>
> --
> Jose R R
> http://www.metztli-it.com
> ---------------------------------------------------------------------------------------------
> Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
> ---------------------------------------------------------------------------------------------
> from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
> ---------------------------------------------------------------------------------------------



-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
