<a name="0.50.0.28"></a>
### 0.50.0.28 (2022-06-09)

#### Features

* add pact-broker subcommand (to be used in preference to broker) so that the pact-broker command are invoked consistently across the gem, pact-ruby-standalone and Docker CLIs	 ([60d80c6](/../../commit/60d80c6))

<a name="0.50.0.27"></a>
### 0.50.0.27 (2022-05-27)

#### Features

* **gems**
  * updated pact_broker-client (1.64.0)	 ([119a2b6](/../../commit/119a2b6))

#### Bug Fixes

* Dockerfile-node-14 to reduce vulnerabilities (#68)	 ([6425f1a](/../../commit/6425f1a))

<a name="0.50.0.26"></a>
### 0.50.0.26 (2022-05-10)

#### Features

* **gems**
  * updated pact_broker-client (1.63.0)	 ([8fb23d7](/../../commit/8fb23d7))

<a name="0.50.0.25"></a>
### 0.50.0.25 (2022-05-10)

#### Features

* add pactflow subcommand (feature toggled off for beta release)	 ([c8f31e6](/../../commit/c8f31e6))

<a name="0.50.0.24"></a>
### 0.50.0.24 (2022-05-10)

#### Features

* **gems**
  * updated pact_broker-client (1.62.1)	 ([85c1ded](/../../commit/85c1ded))

<a name="0.50.0.23"></a>
### 0.50.0.23 (2022-05-10)

#### Features

* **gems**
  * updated pact_broker-client (1.62.0)	 ([b4ea857](/../../commit/b4ea857))

<a name="0.50.0.22"></a>
### 0.50.0.22 (2022-05-09)

#### Features

* **gems**
  * updated pact_broker-client (1.61.1)	 ([dccb196](/../../commit/dccb196))
  * updated pact_broker-client (1.61.0)	 ([ddc5f8c](/../../commit/ddc5f8c))
  * updated pact_broker-client (1.60.0)	 ([cee62e1](/../../commit/cee62e1))

#### Bug Fixes

* 2.7.6-r0 over 2.7.5-r0 of ruby	 ([7139d0c](/../../commit/7139d0c))
* update base image to alpine:3.14	 ([a765d0e](/../../commit/a765d0e))
* update base image to alpine:3.15	 ([b2fbe97](/../../commit/b2fbe97))

<a name="0.50.0.21"></a>
### 0.50.0.21 (2022-03-15)

#### Features

* **gems**
  * updated pact_broker-client (1.59.0)	 ([f12fb6d](/../../commit/f12fb6d))

<a name="0.50.0.20"></a>
### 0.50.0.20 (2022-03-01)

**NOTE: This release drops support for Docker 19.03 (which is now EOL) by upgrading the base image to alpine:3.14.**

#### Features

* update base docker image to alpine:3.14	 ([184f8dc](/../../commit/184f8dc))
* allow non pact commands to be specified (#40)	 ([1f88751](/../../commit/1f88751))

* **gems**
  * updated pact-mock_service (3.10.0)	 ([257d87e](/../../commit/257d87e))
  * updated pact (1.62.0)	 ([9268663](/../../commit/9268663))

#### Bug Fixes

* run bundle install with same bundler version as dockerfile (2.2.20) (#41)	 ([2524ac6](/../../commit/2524ac6))
* specify exit_on_failure? true	 ([4ef8b97](/../../commit/4ef8b97))

<a name="0.50.0.19"></a>
### 0.50.0.19 (2021-12-24)

#### Features

* **gems**
  * updated pact (1.61.0)	 ([47388b0](/../../commit/47388b0))

#### Bug Fixes

* lock versions (#39)	 ([c64aed2](/../../commit/c64aed2))
* Dockerfile-node-14 to reduce vulnerabilities (#37)	 ([a459d6f](/../../commit/a459d6f))

<a name="0.50.0.18"></a>
### 0.50.0.18 (2021-11-13)

#### Features

* **gems**
  * updated pact_broker-client (1.58.0)	 ([b39272c](/../../commit/b39272c))

<a name="0.50.0.17"></a>
### 0.50.0.17 (2021-11-05)

#### Features

* **gems**
  * updated pact_broker-client (1.57.0)	 ([d491060](/../../commit/d491060))

<a name="0.50.0.16"></a>
### 0.50.0.16 (2021-10-27)

#### Features

* **gems**
  * updated pact-provider-verifier (1.36.1)	 ([e7bc6ee](/../../commit/e7bc6ee))

<a name="0.50.0.15"></a>
### 0.50.0.15 (2021-10-26)

#### Bug Fixes

* push Docker image with latest tag as well as semantic version tag when releasing	 ([d66c00b](/../../commit/d66c00b))

<a name="0.50.0.14"></a>
### 0.50.0.14 (2021-10-07)

#### Features

* **gems**
  * updated pact_broker-client (1.56.0)	 ([7417914](/../../commit/7417914))

<a name="0.50.0.13"></a>
### 0.50.0.13 (2021-10-03)

#### Features

* **gems**
  * updated pact_broker-client (1.55.0)	 ([20d7465](/../../commit/20d7465))

<a name="0.50.0.12"></a>
### 0.50.0.12 (2021-10-01)

#### Features

* **gems**
  * updated pact_broker-client (1.54.0)	 ([701be8e](/../../commit/701be8e))

<a name="0.50.0.11"></a>
### 0.50.0.11 (2021-10-01)

#### Features

* **gems**
  * updated pact (1.60.0), pact-support (~> 1.16, >= 1.16.9)	 ([f8121fb](/../../commit/f8121fb))

<a name="0.50.0.10"></a>
### 0.50.0.10 (2021-10-01)

#### Features

* **gems**
  * updated pact-support (1.17.0)	 ([4b16b0a](/../../commit/4b16b0a))
  * updated pact-support (1.16.10)	 ([4e547d4](/../../commit/4e547d4))

<a name="0.50.0.9"></a>
### 0.50.0.9 (2021-09-30)

#### Features

* **gems**
  * updated pact-support (1.16.9)	 ([1bb9006](/../../commit/1bb9006))

<a name="0.50.0.8"></a>
### 0.50.0.8 (2021-09-29)

#### Features

* **gems**
  * updated pact_broker-client (1.53.0)	 ([bd41d47](/../../commit/bd41d47))

<a name="0.50.0.7"></a>
### 0.50.0.7 (2021-09-29)

#### Features

* **gems**
  * updated pact_broker-client (1.52.0)	 ([ec6fd78](/../../commit/ec6fd78))
  * updated pact_broker-client (1.51.2)	 ([621dc1d](/../../commit/621dc1d))

<a name="0.50.0.6"></a>
### 0.50.0.6 (2021-09-21)

#### Features

* **gems**
  * updated pact_broker-client (1.51.1)	 ([7540c62](/../../commit/7540c62))

<a name="0.50.0.5"></a>
### 0.50.0.5 (2021-09-21)

#### Features

* **gems**
  * updated pact_broker-client (1.51.0)	 ([9f16199](/../../commit/9f16199))

<a name="0.50.0.4"></a>
### 0.50.0.4 (2021-09-08)

#### Features

* **gems**
  * updated pact (1.59.0), pact-provider-verifier (1.36.0), pact (~> 1.59)	 ([cbe6d16](/../../commit/cbe6d16))

<a name="0.50.0.3"></a>
### 0.50.0.3 (2021-09-08)

#### Features

* **gems**
  * updated pact (1.57.0), pact-provider-verifier (1.35.2), pact (~> 1.55, < 1.58)	 ([f0a5160](/../../commit/f0a5160))

<a name="0.50.0.2"></a>
### 0.50.0.2 (2021-09-07)

#### Features

* **gems**
  * updated pact (1.59.0)	 ([2b6a945](/../../commit/2b6a945))
  * updated pact (1.58.0)	 ([e03d9e2](/../../commit/e03d9e2))

<a name="0.50.0.1"></a>
### 0.50.0.1 (2021-08-19)

#### Bug Fixes

* Dockerfile to reduce vulnerabilities (#27)	 ([1a2ce17](/../../commit/1a2ce17))

<a name="0.50.0.0"></a>
### 0.50.0.0 (2021-08-19)

#### Features

* **gems**
  * updated pact_broker-client (1.50.0)	 ([7896bb9](/../../commit/7896bb9))

<a name="0.49.0.0"></a>
### 0.49.0.0 (2021-08-05)

#### Features

* **gems**
  * updated pact_broker-client (1.49.0)	 ([bed71d6](/../../commit/bed71d6))

<a name="0.48.0.0"></a>
### 0.48.0.0 (2021-08-04)

#### Features

* **gems**
  * updated pact_broker-client (1.48.0)	 ([67025ad](/../../commit/67025ad))

<a name="0.47.2.0"></a>
### 0.47.2.0 (2021-07-27)

#### Features

* **gems**
  * updated pact-support (1.16.8)	 ([abc375f](/../../commit/abc375f))

<a name="0.47.1.0"></a>
### 0.47.1.0 (2021-07-20)

#### Features

* **gems**
  * updated pact_broker-client (1.47.1)	 ([321fa0c](/../../commit/321fa0c))

<a name="0.47.0.0"></a>
### 0.47.0.0 (2021-07-20)

#### Features

* **gems**
  * updated pact_broker-client (1.47.0)	 ([57e9754](/../../commit/57e9754))

<a name="0.46.1.0"></a>
### 0.46.1.0 (2021-06-30)

#### Features

* **gems**
  * updated pact-provider-verifier (1.35.1)	 ([63db1f5](/../../commit/63db1f5))

<a name="0.46.0.0"></a>
### 0.46.0.0 (2021-06-24)

#### Features

* **gems**
  * updated pact_broker-client (1.46.0)	 ([9875fc2](/../../commit/9875fc2))

<a name="0.45.0.0"></a>
### 0.45.0.0 (2021-06-16)

#### Features

* **gems**
  * updated pact_broker-client (1.45.0)	 ([e64245d](/../../commit/e64245d))

<a name="0.44.0.0"></a>
### 0.44.0.0 (2021-06-09)

#### Features

* **gems**
  * updated pact_broker-client (1.44.0)	 ([6e9a880](/../../commit/6e9a880))

<a name="0.43.0.0"></a>
### 0.43.0.0 (2021-06-03)

#### Features

* **gems**
  * updated pact_broker-client (1.43.0)	 ([dda5730](/../../commit/dda5730))

<a name="0.42.1.0"></a>
### 0.42.1.0 (2021-06-03)

#### Features

* **gems**
  * updated pact-mock_service (3.9.1)	 ([53858ed](/../../commit/53858ed))

<a name="0.42.0.0"></a>
### 0.42.0.0 (2021-05-30)

#### Features

* **gems**
  * updated pact_broker-client (1.42.0)	 ([b8a922d](/../../commit/b8a922d))

<a name="0.41.0.0"></a>
### 0.41.0.0 (2021-05-24)

#### Features

* **gems**
  * updated pact_broker-client (1.41.0)	 ([c377c77](/../../commit/c377c77))

<a name="0.40.0.0"></a>
### 0.40.0.0 (2021-05-18)

#### Features

* **gems**
  * updated pact-mock_service (3.9.0)	 ([3efc6c6](/../../commit/3efc6c6))

<a name="0.39.0.0"></a>
### 0.39.0.0 (2021-04-28)

#### Features

* **gems**
  * updated pact_broker-client (1.40.0)	 ([557d619](/../../commit/557d619))

<a name="0.38.0.0"></a>
### 0.38.0.0 (2021-04-27)

#### Features

* **gems**
  * updated pact_broker-client (1.39.0)	 ([e13aa5b](/../../commit/e13aa5b))

<a name="0.37.3.0"></a>
### 0.37.3.0 (2021-04-20)

#### Features

* **gems**
  * updated pact-message (0.11.1)	 ([5cae038](/../../commit/5cae038))

<a name="0.37.2.0"></a>
### 0.37.2.0 (2021-04-07)

#### Features

* **gems**
  * updated pact_broker-client (1.38.3)	 ([317a508](/../../commit/317a508))

<a name="0.37.1.0"></a>
### 0.37.1.0 (2021-03-31)

#### Features

* **gems**
  * updated pact_broker-client (1.38.2)	 ([3332fce](/../../commit/3332fce))

<a name="0.37.0.0"></a>
### 0.37.0.0 (2021-03-29)

#### Features

* **gems**
  * updated pact-provider-verifier (1.35.0)	 ([3b967bc](/../../commit/3b967bc))

#### Bug Fixes

* Dockerfile-node-14 to reduce vulnerabilities (#24)	 ([cfeecf5](/../../commit/cfeecf5))
* Dockerfile-bundle-base to reduce vulnerabilities (#25)	 ([65b17d6](/../../commit/65b17d6))

<a name="0.36.1.0"></a>
### 0.36.1.0 (2021-03-22)

#### Features

* **gems**
  * updated pact_broker-client (1.38.1)	 ([3644ffa](/../../commit/3644ffa))

<a name="0.36.0.0"></a>
### 0.36.0.0 (2021-03-22)

#### Features

* **gems**
  * updated pact_broker-client (1.38.0)	 ([a67f239](/../../commit/a67f239))

<a name="0.35.0.0"></a>
### 0.35.0.0 (2021-03-22)

#### Features

* **gems**
  * updated pact-message (0.11.0)	 ([957d2ac](/../../commit/957d2ac))

<a name="0.34.1.0"></a>
### 0.34.1.0 (2021-03-10)

#### Features

* **gems**
  * updated pact_broker-client (1.37.1)	 ([6cc140d](/../../commit/6cc140d))

<a name="0.34.0.0"></a>
### 0.34.0.0 (2021-02-28)

#### Features

* **gems**
  * updated pact_broker-client (1.37.0)	 ([24380ab](/../../commit/24380ab))

<a name="0.33.0.0"></a>
### 0.33.0.0 (2021-02-26)

#### Features

* **gems**
  * updated pact_broker-client (1.36.0)	 ([42b177f](/../../commit/42b177f))

<a name="0.32.0.0"></a>
### 0.32.0.0 (2021-02-25)

#### Features

* **gems**
  * updated pact-mock_service (3.8.0)	 ([46c5311](/../../commit/46c5311))

<a name="0.31.0.0"></a>
### 0.31.0.0 (2021-02-01)

#### Features

* **gems**
  * updated pact-provider-verifier (1.34.0)	 ([94804a6](/../../commit/94804a6))

<a name="0.30.0.0"></a>
### 0.30.0.0 (2021-01-31)

#### Features

* **gems**
  * updated pact (1.57.0)	 ([ec38812](/../../commit/ec38812))

<a name="0.29.2.0"></a>
### 0.29.2.0 (2021-01-28)

#### Features

* **gems**
  * updated pact-support (1.16.7)	 ([bc5fc22](/../../commit/bc5fc22))

<a name="0.29.1.0"></a>
### 0.29.1.0 (2021-01-28)

#### Features

* **gems**
  * updated pact-support (1.16.6)	 ([fdc5c49](/../../commit/fdc5c49))

<a name="0.29.0.0"></a>
### 0.29.0.0 (2021-01-26)

#### Features

* **gems**
  * updated pact-provider-verifier (1.33.0), pact (~> 1.55)	 ([9abbfba](/../../commit/9abbfba))

<a name="0.28.0.0"></a>
### 0.28.0.0 (2021-01-25)

#### Features

* **gems**
  * updated pact-message (0.10.0)	 ([6ddfb0f](/../../commit/6ddfb0f))

<a name="0.27.0.0"></a>
### 0.27.0.0 (2021-01-21)

#### Features

* **gems**
  * updated pact (1.56.0)	 ([5131327](/../../commit/5131327))

<a name="0.26.0.0"></a>
### 0.26.0.0 (2021-01-21)

#### Features

* **gems**
  * updated pact_broker-client (1.35.0)	 ([b006913](/../../commit/b006913))

<a name="0.25.2.0"></a>
### 0.25.2.0 (2020-11-25)

#### Features

* **gems**
  * updated pact (1.55.7)	 ([6edafee](/../../commit/6edafee))

<a name="0.25.1.0"></a>
### 0.25.1.0 (2020-11-25)

#### Features

* **gems**
  * updated pact-support (1.16.5)	 ([5ffef02](/../../commit/5ffef02))

<a name="0.25.0.0"></a>
### 0.25.0.0 (2020-11-20)

#### Features

* **gems**
  * updated pact_broker-client (1.34.0)	 ([ae450ec](/../../commit/ae450ec))

<a name="0.24.0.0"></a>
### 0.24.0.0 (2020-11-13)

#### Features

* **gems**
  * updated pact-mock_service (3.7.0), pact-support (~> 1.16, >= 1.16.4)	 ([8b50ed9](/../../commit/8b50ed9))

<a name="0.23.1.0"></a>
### 0.23.1.0 (2020-11-12)

#### Features

* **gems**
  * updated pact-support (1.16.4)	 ([e7481e2](/../../commit/e7481e2))

<a name="0.23.0.0"></a>
### 0.23.0.0 (2020-11-10)

#### Features

* **gems**
  * updated pact_broker-client (1.33.0)	 ([e9b6e89](/../../commit/e9b6e89))

<a name="0.22.4.0"></a>
### 0.22.4.0 (2020-11-10)

#### Features

* **gems**
  * updated pact-support (1.16.3)	 ([819fed7](/../../commit/819fed7))

<a name="0.22.3.0"></a>
### 0.22.3.0 (2020-11-06)

#### Features

* **gems**
  * updated pact-support (1.16.2)	 ([35f37f8](/../../commit/35f37f8))

<a name="0.22.2.0"></a>
### 0.22.2.0 (2020-11-06)

#### Features

* **gems**
  * updated pact-support (1.16.1)	 ([47effdc](/../../commit/47effdc))

<a name="0.22.1.0"></a>
### 0.22.1.0 (2020-11-06)

#### Features

* **gems**
  * updated pact (1.55.6), pact-message (0.9.0)	 ([9077d6e](/../../commit/9077d6e))

<a name="0.22.0.2"></a>
### 0.22.0.2 (2020-11-04)

#### Features

* **gems**
  * updated pact-support (1.16.0)	 ([d2dd336](/../../commit/d2dd336))

<a name="0.21.1.0"></a>
### 0.21.1.0 (2020-11-04)

#### Features

* **gems**
  * updated pact-support (1.15.5)	 ([804aafd](/../../commit/804aafd))

<a name="0.21.0.0"></a>
### 0.21.0.0 (2020-11-04)

#### Features

* **gems**
  * updated pact-support (1.15.4)	 ([6746096](/../../commit/6746096))

<a name="0.20.0.0"></a>
### 0.20.0.0 (2020-11-04)

#### Features

* **gems**
  * updated pact-support (1.15.2)	 ([b75c6a5](/../../commit/b75c6a5))

<a name="0.19.0.0"></a>
### 0.19.0.0 (2020-10-26)

#### Features

* **gems**
  * updated pact_broker-client (1.32.0)	 ([52f1a17](/../../commit/52f1a17))

<a name="0.18.0.0"></a>
### 0.18.0.0 (2020-10-22)

#### Features

* **gems**
  * updated pact_broker-client (1.31.0)	 ([3dc3159](/../../commit/3dc3159))

<a name="0.17.2.0"></a>
### 0.17.2.0 (2020-10-11)

#### Features

* **gems**
  * updated pact (1.55.5)	 ([35cf0b3](/../../commit/35cf0b3))

<a name="0.17.1.0"></a>
### 0.17.1.0 (2020-10-09)

#### Features

* **gems**
  * updated pact (1.55.4)	 ([5bc15b3](/../../commit/5bc15b3))

<a name="0.17.0.0"></a>
### 0.17.0.0 (2020-10-09)

#### Features

* **gems**
  * updated pact_broker-client (1.30.0)	 ([fe3d7ec](/../../commit/fe3d7ec))

* keep build dependencies for node because of the pact ruby standalone	 ([0ca6f5c](/../../commit/0ca6f5c))

<a name="0.16.3.2"></a>
### 0.16.3.2 (2020-10-09)

<a name="0.16.3.0"></a>
### 0.16.3.0 (2020-09-28)


#### Features

* **gems**
  * updated pact (1.55.3), pact-support (~> 1.15), pact-message (0.8.0)	 ([dbd219e](/../../commit/dbd219e))


<a name="0.16.2.0"></a>
### 0.16.2.0 (2020-09-26)


#### Features

* **gems**
  * updated pact (1.55.2)	 ([612d26a](/../../commit/612d26a))


<a name="0.16.1.0"></a>
### 0.16.1.0 (2020-09-26)


#### Features

* **gems**
  * updated pact (1.55.1)	 ([9cbfcfa](/../../commit/9cbfcfa))


<a name="0.16.0.0"></a>
### 0.16.0.0 (2020-09-26)


#### Features

* **gems**
  * updated pact (1.55.0)	 ([49101c7](/../../commit/49101c7))


<a name="0.15.0.1"></a>
### 0.15.0.1 (2020-09-17)


#### Features

* update to alpine:3.12, ruby 2.7, bundler 2.1.4	 ([1b0dad0](/../../commit/1b0dad0))
* clear Gemfile.lock files after the bundle install	 ([a7c24e7](/../../commit/a7c24e7))
* manually delete Gemfile.lock files that are causing false positives in vulnerability scanners	 ([2eb7516](/../../commit/2eb7516))


<a name="0.15.0.0"></a>
### 0.15.0.0 (2020-09-12)


#### Features

* **gems**
  * updated pact (1.54.0)	 ([906fb7c](/../../commit/906fb7c))


<a name="0.14.0.0"></a>
### 0.14.0.0 (2020-09-11)


#### Features

* **gems**
  * updated pact (1.53.0)	 ([f5ac1e7](/../../commit/f5ac1e7))


<a name="0.13.0.0"></a>
### 0.13.0.0 (2020-09-10)


#### Features

* **gems**
  * updated pact (1.52.0)	 ([ba5a084](/../../commit/ba5a084))


<a name="0.12.3.0"></a>
### 0.12.3.0 (2020-08-12)


#### Features

* **gems**
  * updated pact (1.51.1)	 ([2fd8a64](/../../commit/2fd8a64))


<a name="0.12.2.0"></a>
### 0.12.2.0 (2020-08-10)


#### Features

* **gems**
  * updated pact-mock_service (3.6.2)	 ([e98db93](/../../commit/e98db93))


<a name="0.12.1.0"></a>
### 0.12.1.0 (2020-08-07)


#### Features

* **gems**
  * updated pact_broker-client (1.29.1)	 ([5fb527a](/../../commit/5fb527a))


<a name="0.12.0.0"></a>
### 0.12.0.0 (2020-08-05)


#### Features

* **gems**
  * updated pact_broker-client (1.29.0)	 ([be9e9f8](/../../commit/be9e9f8))


<a name="0.11.4.1"></a>
### 0.11.4.1 (2020-07-31)


#### Features

* allow CLI to be executed from any working directory	 ([1a9d95c](/../../commit/1a9d95c))


<a name="0.11.4.0"></a>
### 0.11.4.0 (2020-07-31)


#### Features

* **gems**
  * updated pact_broker-client (1.28.4)	 ([73b0564](/../../commit/73b0564))

* add git to image to support --tag-with-git-branch	 ([7aac3bb](/../../commit/7aac3bb))


<a name="0.11.3.0"></a>
### 0.11.3.0 (2020-07-19)


#### Features

* **gems**
  * updated pact_broker-client (~> 1.28), pact_broker-client (1.28.3)	 ([9281f33](/../../commit/9281f33))


<a name="0.11.2.0"></a>
### 0.11.2.0 (2020-07-18)


#### Features

* **gems**
  * updated pact-provider-verifier (1.32.1)	 ([dfa00a6](/../../commit/dfa00a6))


<a name="0.11.1.0"></a>
### 0.11.1.0 (2020-07-18)


#### Features

* **gems**
  * updated pact-provider-verifier (1.32.0), pact-support (1.15.1)	 ([6abceb3](/../../commit/6abceb3))


<a name="0.11.0.0"></a>
### 0.11.0.0 (2020-07-17)


#### Features

* **gems**
  * updated pact-provider-verifier (1.32.0), pact-support (1.15.1)	 ([5556732](/../../commit/5556732))


<a name="0.7.0.0"></a>
### 0.7.0.0 (2020-07-10)


#### Features

* **gems**
  * updated pact (1.51.0), pact-provider-verifier (1.31.0)	 ([ee0b4a5](/../../commit/ee0b4a5))
  * updated pact (1.51.0), pact-provider-verifier (1.31.0)	 ([4dfb5e9](/../../commit/4dfb5e9))


<a name="0.6.0-1"></a>
### 0.6.0-1 (2020-05-09)


#### Features

* **gems**
  * update to pact-support 1.15.0[32m, pact-mock_service 3.6.1[32m, pact 1.49.3[32m, pact-provider-verifier 1.30.1[32m, pact_broker-client 1.27.0[32m	 ([07dea42](/../../commit/07dea42))


<a name="0.5.0-1"></a>
### 0.5.0-1 (2020-04-17)


#### Features

* **deps**
  * updated to pact (1.49.2), pact-mock_service (3.6.0), pact-support (1.14.3), pact_broker-client (1.26.0)	 ([53e4c84](/../../commit/53e4c84))

* expose stub-service	 ([45678c3](/../../commit/45678c3))


<a name="0.3.0-1"></a>
### 0.3.0-1 (2020-02-13)


#### Features

* **gems**
  * update to pact 1.47.0, pact_broker-client 1.24.0	 ([fbb8fc4](/../../commit/fbb8fc4))


<a name="v0.2.0"></a>
### v0.2.0 (2020-01-30)

#### Features

* allow SSL verification to be disabled by setting the environment variable PACT_DISABLE_SSL_VERIFICATION=true	 ([8375dc8](/../../commit/8375dc8))
