script='query 
  league($competitionId: ID!, $type: SoloRankingType!) {
listCompetitions {
      id
      volume {
        amount
      }
    },
    listSoloRankings(competitionId: $competitionId, type: $type) {
      name
      volume {
        amount
      }
      reward {
        amount
      }
    },
    listTeams(competitionId: $competitionId) {
      name
      captain {
        name
        volume {
          amount
        }
        reward {
          amount
        }
      }
      memberCount
      rank
      reward {
        amount
      }
      volume {
        amount
      }
      teamMembers {
        name
        volume {
          amount
        }
        reward {
          amount
        }
      }
    }
  }
'

variables='{ \"competitionId\": \"2d9c7833-bb12-4719-a1c1-5b14f6934b0c\",
  \"type\": \"TOTAL_VOLUME\"
}
'

#now=$(date +"%b %d, %r")


script="$(echo $script)"   # the query should be onliner, without newlines
variables="$(echo $variables)"   # the query should be onliner, without newlines

curl -H 'Content-Type: application/json' \
   -X POST -d "{ \"query\": \"$script\", \"variables\": \"$variables\" }" https://app.nash.io/api/graphql/explore -o jsons/"$1.json"



